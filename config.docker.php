<?php return array (
  'debug' => getenv('FLARUM_DEBUG') == 'true',
  'database' =>
  array (
    'driver' => getenv('FLARUM_DB_DRIVER') ?: 'mysql',
    'host' => getenv('FLARUM_DB_HOST') ?: 'db',
    'port' => getenv('FLARUM_DB_PORT') ?:'3306',
    'database' => getenv('FLARUM_DB_DATABASE') ?: 'flarum',
    'username' => getenv('FLARUM_DB_USERNAME') ?: 'root',
    'password' => getenv('FLARUM_DB_PASSWORD') ?: '',
    'charset' => getenv('FLARUM_DB_CHARSET') ?: 'utf8mb4',
    'collation' => getenv('FLARUM_DB_COLLATION') ?: 'utf8mb4_unicode_ci',
    'prefix' => getenv('FLARUM_DB_PREFIX') ?: '',
    'strict' => getenv('FLARUM_DB_STRICT') == 'true',
    'engine' => getenv('FLARUM_DB_ENGINE') ?: 'InnoDB',
    'prefix_indexes' => getenv('FLARUM_DB_PREFIX_INDEXES') == 'true',
  ),
  'url' => getenv('FLARUM_URL') ?: 'https://localhost',
  'paths' =>
  array (
    'api' => 'api',
    'admin' => 'admin',
  ),
  'headers' =>
  array (
    'poweredByHeader' => true,
    'referrerPolicy' => 'same-origin',
  ),
);
