###
Dreamscapes\coffeelint-newline-at-eof

Licensed under the BSD (3-Clause) license
For full copyright and license information, please see the LICENSE file

@author     Robert Rossmann <rr.rossmann@me.com>
@copyright  2014 Robert Rossmann
@link       https://github.com/Dreamscapes/coffeelint-newline-at-eof
@license    http://choosealicense.com/licenses/bsd-3-clause   BSD (3-Clause) License
###

class RuleProcessor

  rule:
    name:         'newline_at_eof'
    description:  'Validates a newline policy at the end of each file'
    level:        'error'
    message:      'Incorrect end of file'
    # 'require' or 'forbid' - the first enforces newline character at the end of file, the latter forbids
    # the presence of a newline at the end of file
    behaviour:    'require'

  lintLine: ( line, lineApi ) ->

    if lineApi.isLastLine()
      if @rule.behaviour is 'require' and line.length isnt 0  then return { context: 'Expecting NEWLINE' }
      if @rule.behaviour is 'forbid'  and line.length is 0    then return { context: 'Unexpected NEWLINE' }

    # Not a last line of file
    else return null

module.exports = RuleProcessor
