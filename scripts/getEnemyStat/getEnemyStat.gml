function getEnemyStat(level) {
	return [ //hp, hptype, dmg, dmgtype
		max(ceil(level/2)+irandom_range(1,-1),1),
		irandom_range(0,3),
		max(ceil(level/2)+irandom_range(1,-1),1),
		irandom_range(0,3)
	];
}