$ = require 'fj-config'

$.remBase = 16

exports.lowerBound = (range) ->
    return 0 if range.length <= 0
    range[0]

exports.upperBound = (range) ->
    return 999999999999 if range.length < 2
    range[1]

exports.stripUnit = (num) ->
    parseFloat num

exports.convertToRem = (value, baseValue) ->
    baseValue ?= $.remBase
    value = stripUnit(value) / stripUnit(baseValue) 
    value = value + 'rem' unless value is 0
    value

exports.data = (attr) ->
    if (ns = $.namespace)
        '[data-' + ns + '-' + attr + ']'
    else
        '[data-' + attr + ']'

exports.remCalc = (values, baseValue) ->
    baseValue ?= $.remBase
    return convertToRem values[0], baseValue if values.length is 1
    values.map (value) ->
        convertToRem value, baseValue

exports.rgba = (hex, opacity) ->
    hex = hex.replace '#',''
    r = parseInt hex.substring(0,2), 16
    g = parseInt hex.substring(2,4), 16
    b = parseInt hex.substring(4,6), 16
    'rgba(' + r + ',' + g + ',' + b + ',' + opacity + ')'