function getEnemySequence(sequence){
	sequence = array_create(0);//pause, do dmg, pause
	array_push(sequence, 1);
	array_push(sequence, 1);
	array_push(sequence, 0);
	
	return sequence;
}