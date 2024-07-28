#region MOVE E ANIMATION
	var _cima = keyboard_check(ord("W"))
	var _baixo = keyboard_check(ord("S"))
	var _direito = keyboard_check(ord("D"))
	var _esq = keyboard_check(ord("A"))
	
	var _tecla = _direito -_esq !=0 or _baixo -_cima !=0;
	
	 if (_direito == _esq){
		_direito = 0;
		_esq = 0;
	 }
	 
	 if (_cima == _baixo){
		_baixo = 0;
		_cima = 0;
	 }
	 
	dir = point_direction(0,0, _direito-_esq, _baixo-_cima);
	
	vhor= lengthdir_x(velc * _tecla,dir);
	vver= lengthdir_y(velc * _tecla,dir);
	
	
	x= x+vhor;
	y= y+vver;
	
	
	// MUDANÇA DE SPRITES - ANIMAÇÃO
	
	if ( vver !=0 or vhor !=0){
		movendo = 1;
	}

	else{
		movendo = 0
		dire = 0
	}
	
	if(_cima) dire = 0
	if(_baixo) dire = 3
	if(_direito) dire = 1
	if(_esq) dire = 2

	sprite_index = sprites[movendo][dire]
	
#endregion	
	
	// PEGAR ITEM DO CHÃO
	
if instance_exists(obj_item) and obj_inventa.invetario == false{
	var _inst = instance_nearest(x,y, obj_item);
	if distance_to_point(_inst.x,_inst.y) <=20{
		if keyboard_check_pressed(ord("E")){
			ds_grid_add_itens(_inst.image_index, _inst.quantia, _inst.sprite_index);
			
			instance_destroy(_inst);
		}
	}
}		

#region
		if place_meeting( x+vhor, y, obj_colisao_pai){
			while ! place_meeting(x=sign(vhor),y, teste_colisor){
				x+=sign(vhor);
			}
			vhor = 0;
		}
		x+=vhor;
		
		
		if place_meeting(x,y + vver, teste_colisor){
			while ! place_meeting(x,y +sign(vver), teste_colisor){
			y+=sign(vver)}
			vver = 0
		}
		y+=vver;
#endregion