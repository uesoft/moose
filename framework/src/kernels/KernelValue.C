//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "KernelValue.h"

// MOOSE includes
#include "Assembly.h"
#include "MooseVariableField.h"
#include "SubProblem.h"
#include "SystemBase.h"

#include "libmesh/quadrature.h"

template <>
InputParameters
validParams<KernelValue>()
{
  InputParameters params = validParams<Kernel>();
  return params;
}

KernelValue::KernelValue(const InputParameters & parameters) : Kernel(parameters) {}

void
KernelValue::computeResidual()
{
  DenseVector<Number> & re = _assembly.residualBlock(_var.number());
  _local_re.resize(re.size());
  _local_re.zero();

  const unsigned int n_test = _test.size();
  for (_qp = 0; _qp < _qrule->n_points(); _qp++)
  {
    Real value = precomputeQpResidual() * _JxW[_qp] * _coord[_qp];
    for (_i = 0; _i < n_test; _i++) // target for auto vectorization
      _local_re(_i) += value * _test[_i][_qp];
  }

  re += _local_re;

  if (_has_save_in)
  {
    Threads::spin_mutex::scoped_lock lock(Threads::spin_mtx);
    for (const auto & var : _save_in)
      var->sys().solution().add_vector(_local_re, var->dofIndices());
  }
}

void
KernelValue::computeJacobian()
{
  DenseMatrix<Number> & ke = _assembly.jacobianBlock(_var.number(), _var.number());
  _local_ke.resize(ke.m(), ke.n());
  _local_ke.zero();

  const unsigned int n_test = _test.size();
  for (_qp = 0; _qp < _qrule->n_points(); _qp++)
    for (_j = 0; _j < _phi.size(); _j++)
    {
      Real value = precomputeQpJacobian() * _JxW[_qp] * _coord[_qp];
      for (_i = 0; _i < n_test; _i++) // target for auto vectorization
        _local_ke(_i, _j) += value * _test[_i][_qp];
    }

  ke += _local_ke;

  if (_has_diag_save_in)
  {
    unsigned int rows = ke.m();
    DenseVector<Number> diag(rows);
    for (unsigned int i = 0; i < rows; i++) // target for auto vectorization
      diag(i) = _local_ke(i, i);

    Threads::spin_mutex::scoped_lock lock(Threads::spin_mtx);
    for (const auto & var : _diag_save_in)
      var->sys().solution().add_vector(diag, var->dofIndices());
  }
}

void
KernelValue::computeOffDiagJacobian(MooseVariableFE & jvar)
{
  size_t jvar_num = jvar.number();
  if (jvar_num == _var.number())
    computeJacobian();
  else
  {
    DenseMatrix<Number> & ke = _assembly.jacobianBlock(_var.number(), jvar_num);

    for (_j = 0; _j < jvar.phiSize(); _j++)
      for (_qp = 0; _qp < _qrule->n_points(); _qp++)
        for (_i = 0; _i < _test.size(); _i++)
          ke(_i, _j) += _JxW[_qp] * _coord[_qp] * computeQpOffDiagJacobian(jvar_num);
  }
}

Real
KernelValue::computeQpResidual()
{
  return 0.0;
}

Real
KernelValue::precomputeQpJacobian()
{
  return 0.0;
}
