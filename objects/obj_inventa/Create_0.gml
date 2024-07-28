
	invetario = false;
	scale = 2;
	
	x_cord = 33 * scale;
	y_cord = 19 * scale;
	
	slots_v = 2;
	slots_h = 5;
	slots_t = (slots_h * slots_v);
	
	size_slots = 28 * scale;
	buffer = 4 * scale;
	
	inv_lar = sprite_get_width(spr_inventario1) * scale;
	inv_hon = sprite_get_height(spr_inventario1) * scale;
	
	item_select = -1;
	position_select = -1;
#region grid inv 

	
	
	enum MACHADOS{
		COMBAT,
		EXTRAT,
		ALTURA
	}
	
	enum ALIMENTOS{
		ALFACE,
		PAO,
		OVO,
		ALTURA
	}
	
	enum INFO {
		ITEM,
		QUANTIDADE,
		XSPRITE,
		ALTURA
	}

		grid_itens = ds_grid_create(INFO.ALTURA, slots_t);
		ds_grid_set_region(grid_itens, 0,0 ,INFO.ALTURA - 1, slots_t -1, -1);
		
		ds_grid_add_itens(ALIMENTOS.ALFACE, 50, spr_alimentos_icon);
		ds_grid_add_itens(ALIMENTOS.OVO, 10,	spr_alimentos_icon);
		ds_grid_add_itens(MACHADOS.EXTRAT, 1,	spr_machados_icone);
		ds_grid_add_itens(ALIMENTOS.PAO, 25,		spr_alimentos_icon);
		ds_grid_add_itens(MACHADOS.COMBAT,1,	spr_machados_icone);
#endregion