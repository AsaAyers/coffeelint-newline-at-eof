###
Dreamscapes\coffeelint-newline-at-eof

Licensed under the BSD (3-Clause) license
For full copyright and license information, please see the LICENSE file

@author     Robert Rossmann <rr.rossmann@me.com>
@copyright  2014 Robert Rossmann
@link       https://github.com/Dreamscapes/coffeelint-newline-at-eof
@license    http://choosealicense.com/licenses/bsd-3-clause   BSD (3-Clause) License
###

# Import dependencies
should        = require 'should'
RuleProcessor = require '../src/RuleProcessor'

describe 'RuleProcessor', () ->

  # Define some frequently used vars used across the test suite

  processor       = undefined         # populated in beforeEach()
  fakeAPI         = undefined         # populated in beforeEach()
  setBehaviour    = ( behaviour ) ->  # A switch helper to modify the tested behaviour on the fly
    fakeAPI.config[processor.rule.name].behaviour = behaviour

  # Setup function to be executed before each test
  beforeEach () ->
    processor = new RuleProcessor
    fakeAPI   =
      isLastLine: () -> return true
      config: {}

    # This is where Coffeelint keeps its runtime configuration options for each rule
    fakeAPI.config[processor.rule.name] =
      behaviour: 'require'


  # Begin testing!

  it 'should have newline required by default', () ->
    processor.rule.should.have.property 'behaviour', 'require'

  it 'should do nothing when not on last line', () ->
    fakeAPI.isLastLine = () -> return false   # Test-specific method override
    result = processor.lintLine 'some content', fakeAPI
    should.not.exist result

  it 'should trigger on non-newline files if required', () ->
    result = processor.lintLine 'some content', fakeAPI
    result.should.have.property 'context'

  it 'should not trigger on newline files if required', () ->
    result = processor.lintLine '', fakeAPI
    should.not.exist result

  it 'should not trigger on non-newline files if forbidden', () ->
    setBehaviour 'forbid'  # Ensure that forbidding is set
    result = processor.lintLine 'some content', fakeAPI
    should.not.exist result

  it 'should trigger on newline files if forbidden', () ->
    setBehaviour 'forbid'  # Ensure that forbidding is set
    result = processor.lintLine '', fakeAPI
    result.should.have.property 'context'
