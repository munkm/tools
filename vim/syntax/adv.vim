" Vim syntax file
" Language: ADVANTG input file
" Version: 1.00
" Last Change: 2012 July 20
" Maintainer: Seth R Johnson
" Based on conf.vim by Bram Moolenaar <Bram@vim.org>
" Number regex from python.vim by Zvezdan Petkovic <zpetkovic@acm.org> et al
"
" ADVANTG developers: to regenerate the list of keywords, run the command:
"
"   python -m advantg.input
"
" To use, put this file in your ~/.vim/syntax folder and add the following
" line to your vimrc:
"
"  autocmd BufRead,BufNewFile *.adv set filetype=adv
"

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif


syn keyword advTodo contained TODO FIXME XXX
syn keyword advKeyword
  \ mesh_refinement mesh_x mesh_x_ints mesh_x_max_width mesh_x_min_width
  \ mesh_y mesh_y_ints mesh_y_max_width mesh_y_min_width mesh_z
  \ mesh_z_ints mesh_z_max_width mesh_z_min_width method mglib model
  \ outputs response_detectors response_save_csv response_save_plots
  \ response_sources silo_response_ids silo_source_ids
  \ silo_source_strength silo_ww solver sword_input sword_mix_tolerance
  \ sword_sampling sword_small_sources sword_subcell sword_subcell_x
  \ sword_subcell_y sword_subcell_z anisn_library anisn_zaid_map
  \ denovo_disable_upscatter denovo_discretization denovo_energy_sets
  \ denovo_first_group denovo_krylov_space denovo_last_group
  \ denovo_max_iterations denovo_mc_first_collision
  \ denovo_mc_num_particles denovo_multigroup_solver
  \ denovo_partition_upscatter denovo_pn_order denovo_preconditioner
  \ denovo_quadrature denovo_silo_mixed denovo_solver
  \ denovo_subtract_upscatter denovo_tolerance
  \ denovo_transport_correction denovo_two_grid
  \ denovo_upscatter_inner_iterations denovo_upscatter_inner_tolerance
  \ denovo_upscatter_solver denovo_upscatter_tolerance denovo_verbose
  \ denovo_x_blocks denovo_y_blocks denovo_z_blocks dx_adjoint
  \ dx_forward fwcadis_response_weighting fwcadis_spatial_treatment
  \ mcnp_input mcnp_material_names mcnp_max_source_cycles
  \ mcnp_max_source_samples mcnp_min_rays_per_face
  \ mcnp_min_source_bin_samples mcnp_min_source_voxel_samples
  \ mcnp_mxspln mcnp_num_rays mcnp_num_sb_samples
  \ mcnp_num_source_samples mcnp_ray_directions mcnp_tallies
  \ mcnp_ww_ratio mesh_max_width mesh_min_width sword_resolution
  \ denovo_ldfe_order denovo_quad_file denovo_quad_num_azi
  \ denovo_quad_num_azi_vec denovo_quad_num_polar denovo_quad_order
  \ denovo_quad_polar_axis fwcadis_max_response fwcadis_min_response
syn keyword advBoolean true false True False t f
syn match advComment "#.*" contains=advTodo
syn region advString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline

" Numbers
syn match advFloat "\<\%([1-9]\d*\|0\)\>"
syn match advFloat "\<\d\+[eE][+-]\=\d\+\>"
syn match advFloat "\<\d\+\.\%([eE][+-]\=\d\+\)\=\%(\W\|$\)\@="
syn match advFloat "\%(^\|\W\)\@<=\d*\.\d\+\%([eE][+-]\=\d\+\)\=\>"

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi link advComment Comment
hi link advTodo Todo
hi link advString String
hi link advKeyword Keyword
hi link advFloat Float
hi link advBoolean Boolean

let b:current_syntax = "adv"

" vim: ts=8 sw=2
