<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'cmarteau' );

/** MySQL database password */
define( 'DB_PASSWORD', 'yo' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '<B)seb&|rX-eRl$CuC&GNEI+~a>K|-.Z|>C~*Wu`i}WPqWed&ztmcX{@kAQf,#Ql');
define('SECURE_AUTH_KEY',  '{D+G&M9p*aqRPA*Ti]L[)#IsCD|Q:9Wn_z+M3,:9aKxSj@L&XXd9l*IC]Hj6OLsl');
define('LOGGED_IN_KEY',    '6e}1uTeV:(DP<Hsak>P+)QS**!,1>R:kbvo?gNn&l+>!(H3zPctesX*U`gvJ6WGm');
define('NONCE_KEY',        '+%^m3k&`9L]${~A1$02:U+l<gSaiHtecyYBM|F1;;}Ej93>sz^G.+WMBXzb7PoU+');
define('AUTH_SALT',        '-K>H|J|>/Bnh 4WXAm imWa?(5p]M2%JQCg3o6F|3.W+/c_AEO_|- ,*PI%uE^e7');
define('SECURE_AUTH_SALT', '}8l^ztga^aHVa<N](J[b1qI2NY_2iD&[~j*N}tT_CfKa,jm+KL#:j~g/9,RDe2<$');
define('LOGGED_IN_SALT',   'a#U~87.p-n#&SXz^R>gK{du+e+-Ueu_V6[bG1#@T65ID&?<@<uHd8rJeM)M-&ujn');
define('NONCE_SALT',       '0%x--`!N:_Ms5*l3<|CiF8uY!>~f#HTS[O5|ObNCGzc}/X2?9R(|XlM+AETSZp0!');

/**#@-*/

/**
 * WordPress Database Table :prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
