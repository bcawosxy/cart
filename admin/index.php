<?php
// Version
define('VERSION', '2.3.0.2');
date_default_timezone_set("Asia/Taipei");
// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// Install
if (!defined('DIR_APPLICATION')) {
	header('Location: ../install/index.php');
	exit;
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');

//set memory_limit
ini_set('memory_limit', '128M');

start('admin');