// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/*function draw_text_colour_outline(){
	///@arg x
	///@arg y
	///@arg str
	///@arg outwidth
	///@arg	outcol
	///@arg	outfidelity
	///@arg	separation
	///@arg	width
	
	var _dto_dcol = draw_get_color();
	draw_set_color(argument4);
	
	
}*/   //PROCURAR SCRIPT COMPLETO

	function ds_grid_add_itens(){
		///@arg Item
		///@arg Quantidade
		///@arg Sprite
		
		var _grid =  obj_inventa.grid_itens;
		var _checagem = 0;
		
			while _grid[# INFO.ITEM, _checagem] != -1 {
				_checagem++;
			}
			
			_grid[# 0, _checagem] = argument[0];
			_grid[# 1, _checagem] = argument[1];
			_grid[# 2, _checagem] = argument[2];
	}