<?php
define('DB_NAME', getenv('MYSQL_DATABASE'));
define('DB_USER', getenv('MYSQL_USER'));
define('DB_PASSWORD', getenv('MYSQL_PASSWORD'));
define('DB_HOST', 'mariadb:3306');

define('AUTH_KEY',         'random_unique_key_afayad');
define('SECURE_AUTH_KEY',  'random_unique_key_afayad');
define('LOGGED_IN_KEY',    'random_unique_key_afayad');
define('NONCE_KEY',        'random_unique_key_afayad');
define('AUTH_SALT',        'random_unique_key_afayad');
define('SECURE_AUTH_SALT', 'random_unique_key_afayad');
define('LOGGED_IN_SALT',   'random_unique_key_afayad');
define('NONCE_SALT',       'random_unique_key_afayad');

$table_prefix = 'wp_';
define('WP_DEBUG', false);
if (!defined('ABSPATH'))
    define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
?>
