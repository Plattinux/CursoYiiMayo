<?php

// This is the database connection configuration.
return array(
	//'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
	// uncomment the following lines to use a MySQL database
	
	'connectionString' => 'pgsql:host=localhost;dbname=yiitwitter',
	'emulatePrepare' => true,
	'username' => 'postgres',
	'password' => 'linux',
	'charset' => 'utf8',
	
);
