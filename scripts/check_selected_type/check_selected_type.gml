function check_selected_type(array, val){
	var num = 0;
	
	for(var i = 0; i < array_length(array); i++)
		if(array_get(array,i).index==val)
			num++;
	
	return num;
}