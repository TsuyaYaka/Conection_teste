
	var _guilarg = display_get_gui_width();
	var _guicomp = display_get_gui_height();
	
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);
	
	if invetario == true{
		var _invx = _guilarg/2 - inv_lar/2;
		var _invy = _guicomp/2 - inv_hon/2;
		
		draw_sprite_ext(spr_inventario1, 0, _invx, _invy, scale, scale, 0, c_white, 1);
		
	var _ix = 0;
	var _iy = 0;
	
	for (var _i = 0; _i < slots_t; _i++ ){		
		
		var _slotx = _invx + x_cord + ((size_slots + buffer)*_ix);
		var _sloty = _invy + y_cord +((size_slots + buffer + 4)*_iy);
	
		//VERIFICAÇÃO DO MOUSE
		if point_in_rectangle(_mx,_my, _slotx,_sloty, _slotx+size_slots, _sloty+size_slots){
			draw_sprite_ext(spr_slot_ocup, 0, _slotx, _sloty, scale, scale, 0, c_white, 1)
	
	    //DROPAR ITENS
			if keyboard_check_pressed(ord("G")){
				var _inst = instance_create_layer(obj_playin.x, obj_playin.y, "Instances", obj_item);
				
				_inst.image_index = grid_itens[# INFO.ITEM, _i];
				_inst.quantia = grid_itens[# INFO.QUANTIDADE, _i];
				_inst.sprite_index = grid_itens[# INFO.XSPRITE, _i];
				
				grid_itens [# INFO.ITEM, _i] = -1;
				grid_itens [# INFO.QUANTIDADE, _i] = -1;
				grid_itens [# INFO.XSPRITE, _i] = -1;
			}  
		
		//SELECIONAR E MUDAR LOCAL DE ITENS
			if mouse_check_button_pressed(mb_left){
			
			//VAI SELECIONAR UM ITEM
				if item_select == -1{
					item_select = grid_itens [# INFO.ITEM, _i];
					position_select = _i;
					
				} /*JÁ SELECIONOU*/ else{
						//1ºcaso: SOMA DE ITENS IGUAIS
					if item_select == grid_itens[# INFO.ITEM, _i] and position_select != _i and grid_itens[# INFO.XSPRITE, _i] == grid_itens[# INFO.XSPRITE, position_select]{
						grid_itens [# INFO.QUANTIDADE, _i] += grid_itens [# INFO.QUANTIDADE, position_select];
					
						grid_itens [# INFO.ITEM, position_select] = -1;
						grid_itens [# INFO.QUANTIDADE, position_select] = -1;
						item_select = -1;
						position_select = -1;
					}	
						
						//2ºcaso: TROCA DE LOCAIS EM UM SLOT JÁ OCUPADO
					else if grid_itens[# INFO.ITEM, position_select] != grid_itens[# INFO.ITEM, _i] and grid_itens[# INFO.XSPRITE, _i] != -1 or grid_itens[# INFO.XSPRITE, position_select] != grid_itens[# INFO.ITEM, _i]{
						var _item1 = grid_itens[# INFO.ITEM, _i]
						var _item2 = grid_itens[# INFO.QUANTIDADE, _i]
						var _item3 = grid_itens[# INFO.XSPRITE, _i];
						
						grid_itens[# INFO.ITEM, _i] = grid_itens [# INFO.ITEM, position_select];
						grid_itens[# INFO.QUANTIDADE, _i] = grid_itens [# INFO.QUANTIDADE, position_select];
						grid_itens[# INFO.XSPRITE, _i] = grid_itens [# INFO.XSPRITE, position_select];
						
						 grid_itens [# INFO.ITEM, position_select] = _item1;
						 grid_itens [# INFO.QUANTIDADE, position_select] = _item2;
						 grid_itens [# INFO.XSPRITE, position_select] = _item3;
						
						item_select = -1;
						position_select = -1;
					} 
						//3ºcaso: MUDANÇA DE LOCAL EM SLOT VAZIO
					else if grid_itens[# INFO.ITEM, _i] == -1 {
						grid_itens[# INFO.ITEM, _i] = grid_itens [# INFO.ITEM, position_select];
						grid_itens[# INFO.QUANTIDADE, _i] = grid_itens [# INFO.QUANTIDADE, position_select];
						grid_itens[# INFO.XSPRITE, _i] = grid_itens [# INFO.XSPRITE, position_select];
						
						grid_itens [# INFO.ITEM, position_select] = -1;
						grid_itens [# INFO.QUANTIDADE, position_select] = -1;
						grid_itens [# INFO.XSPRITE, position_select] = -1;
						item_select = -1;
						position_select = -1;
					}
					
					
			
					
						
				}
				
			} 
		}
		
			//PEGAR O SPRITE DO ITEM
		var _sprite = grid_itens[# INFO.XSPRITE, _i]; 
		
		//VERIFICAÇÃO DE ITEM
		if grid_itens[# INFO.ITEM, _i] != -1{
			//DRAW SPRITE
			draw_sprite_ext(_sprite, grid_itens[# 0, _i], _slotx -5, _sloty, scale, scale, 0, c_white, 1 );
			
			//DRAW QUANTIDADE
			draw_set_font(fnt_font1);
			draw_set_halign(fa_center);
			draw_text_transformed_color(_slotx + size_slots,_sloty+size_slots -8 , grid_itens[# INFO.QUANTIDADE, _i],scale,scale,0,0,0,0,0,1);
		}
		
		_ix++;
		if( _ix >= slots_h){
			_ix = 0;
			_iy++;
		}
	}
	
	
		if item_select != -1{
			draw_sprite_ext(grid_itens [# INFO.XSPRITE, position_select], item_select, _mx, _my, scale, scale, 0, c_white, 0.5);
		}
}