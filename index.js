/**
 * Dreamscapes\coffeelint-newline-at-eof
 *
 * Licensed under the BSD (3-Clause) license
 * For full copyright and license information, please see the LICENSE file
 *
 * @author     Robert Rossmann <rr.rossmann@me.com>
 * @copyright  2014 Robert Rossmann
 * @link       https://github.com/Dreamscapes/coffeelint-newline-at-eof
 * @license    http://choosealicense.com/licenses/bsd-3-clause    BSD (3-Clause) License
 */

// Register CoffeeScript Redux compiler
require( 'coffee-script-redux/register' );

// Export the Rule handler class - it will be automatically compiled to js by CS-Redux
module.exports = require( './src/RuleProcessor' );
