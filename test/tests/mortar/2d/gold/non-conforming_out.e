CDF      
       
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes      ;   num_elem   (   
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_el_in_blk2        num_nod_per_el2       num_el_in_blk3        num_nod_per_el3       num_side_ss1      num_side_ss2      num_side_ss3      num_side_ss4      num_side_ss5      num_side_ss6      num_nod_ns1       num_nod_ns2       num_nod_ns3       num_nod_ns4       num_nod_ns5       num_nod_ns6       num_nod_var       num_info     num_glo_var             api_version       @�
=   version       @�
=   floating_point_word_size            	file_size               int64_status             title         non-conforming_out.e       maximum_name_length                 )   
time_whole                            h�   	eb_status                             �   eb_prop1               name      ID              �   	ns_status         	                    �   ns_prop1      	         name      ID              �   	ss_status         
                    �   ss_prop1      
         name      ID              �   coordx                     �         coordy                     �      �   eb_names                       d      �   ns_names      	                 �      (   ss_names      
                 �      �   
coor_names                         D      �   connect1                  	elem_type         QUAD4        �      �   elem_num_map                    �      |   connect2                  	elem_type         QUAD4         �         connect3                  	elem_type         EDGE2         @      �   elem_ss1                          �   side_ss1                          �   elem_ss2                             side_ss2                          $   elem_ss3                          <   side_ss3                          T   elem_ss4                          l   side_ss4                          �   elem_ss5                          �   side_ss5                          �   elem_ss6                          �   side_ss6                          �   node_ns1                          �   node_ns2                           �   node_ns3                              node_ns4                          8   node_ns5                          T   node_ns6                          h   vals_nod_var1                         �      h�   vals_nod_var2                         �      jh   name_nod_var                       D      |   info_records                      Q�      �   name_glo_var                       $      hd   vals_glo_var                             l@                 �                              d   e                                 d   e   @       @       ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      @                       ?�      @      @      @      @      @       @       @      @      ?�                      ?�      ?�      ?�      ?�      @      @      @      @      ?�              ?�      ?�      ?�      ?�                      @      @      @      @      ?�      @      @      ?�                      ?�      ?�      ?�      ?�      @       @      @      @              ?�      ?�              ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�              ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�                      ?�      ?�      ?�      ?�      ?�                      ?�      ?�      ?�      @      @      ?�      ?�      @      @      @      @      @      @      ?�      ?�      @      @      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�      ?�                                                                        middle                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 	   
                  
   	                                                                     
                  
                                                                                                                !                "   	      #      	   "                           	   
                                                                      !   "   #   $   %   &   '   (   $   %   &   '   (   '   &   )   *   +   ,   -   .   %   ,   +   $   /   ,   %   0   -   ,   /   .   1   &   %   2   )   &   1   3   4   4   5   5   6   6   7   7   8   8   9   9   :   :   ;                                                                               
                                                                                                                                         !               #   (   )   2               !   *   -   0                  "   #   $   '   (   /   0   *   +   .   1   2u                                lm                                 ####################                                                             # Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                   -i                                                                               non-conforming.i                                                                 -ksp_monitor                                                                                                                                                      ### Version Info ###                                                             Framework Information:                                                           SVN Revision:            21641                                                   PETSc Version:           3.3.0                                                   Current Time:            Mon Sep 23 11:21:32 2013                                Executable Timestamp:    Mon Sep 23 10:15:52 2013                                                                                                                                                                                                  ### Input File ###                                                                                                                                                []                                                                                 initial_from_file_timestep     = 2                                               initial_from_file_var          =                                                 block                          =                                                 coord_type                     = XYZ                                             fe_cache                       = 0                                               name                           = 'MOOSE Problem'                                 type                           = FEProblem                                       order                          = AUTO                                            active_bcs                     =                                                 active_kernels                 =                                                 inactive_bcs                   =                                                 inactive_kernels               =                                                 start                          = 0                                               decomposition                  =                                                 dimNearNullSpace               = 0                                               dimNullSpace                   = 0                                               long_name                      =                                                 solve                          = 1                                             []                                                                                                                                                                [BCs]                                                                                                                                                               [./all]                                                                            boundary                     = '1 2 3 4'                                         type                         = FunctionDirichletBC                               use_displaced_mesh           = 0                                                 variable                     = u                                                 function                     = exact_sln                                         long_name                    = BCs/all                                         [../]                                                                                                                                                             [./mortar]                                                                         boundary                     = '100 101'                                         type                         = DiffusionFluxBC                                   use_displaced_mesh           = 0                                                 variable                     = u                                                 diag_save_in                 =                                                   long_name                    = BCs/mortar                                        save_in                      =                                                 [../]                                                                          []                                                                                                                                                                [Constraints]                                                                                                                                                       [./ced]                                                                            type                         = EqualValueConstraint                              interface                    = middle                                            long_name                    = Constraints/ced                                   master_variable              = u                                                 slave_variable               =                                                   variable                     = lm                                              [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      l_abs_step_tol                 = -1                                              l_max_its                      = 10000                                           l_tol                          = 1e-05                                           line_search                    = default                                         nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-50                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-13                                           no_fe_reinit                   = 0                                               petsc_options                  =                                                 petsc_options_iname            =                                                 petsc_options_value            =                                                 print_linear_residuals         = 0                                               solve_type                     = PJFNK                                           type                           = Steady                                          _fe_problem                    = 0x7fb481069a00                                  long_name                      = Executioner                                     restart_file_base              =                                               []                                                                                                                                                                [Functions]                                                                                                                                                         [./exact_sln]                                                                      type                         = ParsedFunction                                    long_name                    = Functions/exact_sln                               vals                         =                                                   value                        = y                                                 vars                         =                                                 [../]                                                                                                                                                             [./ffn]                                                                            type                         = ParsedFunction                                    long_name                    = Functions/ffn                                     vals                         =                                                   value                        = 0                                                 vars                         =                                                 [../]                                                                          []                                                                                                                                                                [Kernels]                                                                                                                                                           [./diff]                                                                           type                         = Diffusion                                         block                        =                                                   diag_save_in                 =                                                   long_name                    = Kernels/diff                                      save_in                      =                                                   use_displaced_mesh           = 0                                                 variable                     = u                                               [../]                                                                                                                                                             [./ffn]                                                                            block                        =                                                   diag_save_in                 =                                                   function                     = ffn                                               save_in                      =                                                   use_displaced_mesh           = 0                                                 variable                     = u                                               [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  =                                                 block_id                       =                                                 block_name                     =                                                 boundary_id                    =                                                 boundary_name                  =                                                 centroid_partitioner_direction =                                                 construct_side_list_from_node_list = 0                                           ghosted_boundaries             =                                                 ghosted_boundaries_inflation   =                                                 partitioner                    = metis                                           patch_size                     = 40                                              second_order                   = 0                                               type                           = FileMesh                                        uniform_refine                 = 0                                               dim                            = 3                                               distribution                   = DEFAULT                                         file                           = non-conf-coarse.e                               long_name                      = Mesh                                            nemesis                        = 0                                               skip_partitioning              = 0                                             []                                                                                                                                                                [MortarInterfaces]                                                                                                                                                  [./middle]                                                                         master                       = 100                                               slave                        = 101                                               subdomain                    = 1000                                            [../]                                                                          []                                                                                                                                                                [Output]                                                                           color_output                   = 1                                               elemental_as_nodal             = 0                                               exodus                         = 1                                               exodus_inputfile_output        = 1                                               file_base                      = non-conforming_out                              gmv                            = 0                                               gnuplot_format                 = ps                                              hidden_variables               =                                                 interval                       = 1                                               iteration_plot_start_time      = 1.79769e+308                                    max_pps_rows_screen            = 15                                              nemesis                        = 0                                               num_restart_files              = 0                                               output_displaced               = 0                                               output_es_info                 = 1                                               output_if_base_contains        =                                                 output_initial                 = 1                                               output_solution_history        = 0                                               output_variables               =                                                 perf_log                       = 1                                               position                       =                                                 postprocessor_csv              = 0                                               postprocessor_gnuplot          = 0                                               postprocessor_screen           = 1                                               pps_fit_to_screen              = ENVIRONMENT                                     screen_interval                = 1                                               show_setup_log_early           = 0                                               tecplot                        = 0                                               tecplot_binary                 = 0                                               time_interval                  =                                                 vtk                            = 0                                               xda                            = 0                                             []                                                                                                                                                                [Postprocessors]                                                                                                                                                    [./l2_error]                                                                       type                         = ElementL2Error                                    block                        = '1 2'                                             execute_on                   = timestep                                          function                     = exact_sln                                         long_name                    = Postprocessors/l2_error                           output                       = auto                                              use_displaced_mesh           = 0                                                 variable                     = u                                               [../]                                                                          []                                                                                                                                                                [Preconditioning]                                                                                                                                                   [./fmp]                                                                            line_search                  = default                                           petsc_options                =                                                   petsc_options_iname          =                                                   petsc_options_value          =                                                   print_linear_residuals       = 0                                                 solve_type                   =                                                   type                         = SMP                                               full                         = 1                                                 long_name                    = Preconditioning/fmp                               off_diag_column              =                                                   off_diag_row                 =                                                   pc_side                      = right                                           [../]                                                                          []                                                                                                                                                                [Variables]                                                                                                                                                         [./lm]                                                                             block                        = middle                                            family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        =                                                 [../]                                                                                                                                                             [./u]                                                                              block                        = '1 2'                                             family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        =                                                 [../]                                                                          []                                                                                 l2_error                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    @��.B9�?�              ?�������?�             ?�     -?�     ?�     ?�     3?�     I?�     6?�������?�������?�������        ?�������?�     7?�     
?�������?�     ?�������?�������?�������?�      ?�������                ?�������?�������?�     z?�������?�������                ?�     �?�������?�������@     @     ?�     �?�������@������@������@������@     @������@������?�     F?�������@������@������                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        @�կ���֦	r����g�"����z�ԩ���1�/��N�b�E�ɿ��vQ�3�{�g���@)`���J�=�%�: