//Function that converts text to uppercase or lowercase
function changeCaseOfText(text, caseToSwitchTo) {
    var alteredText = text
    if (caseToSwitchTo === "lower") {
        alteredText = alteredText.toLowerCase()
    }
    else if (caseToSwitchTo === "upper") {
        alteredText = alteredText.toUpperCase()
    }
    return alteredText
}

//Handler that trims text
function trimText(text, charsToTrim, direction) {
    var result = text
    var regexString = charsToTrim.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&");
    if (direction === "beginning" || direction === "both") {
        var regex = new RegExp(`^(?:${regexString})*`)
        result = result.replace(regex, "")
    }
    if (direction === "end" || direction === "both") {
        var regex = new RegExp(`(?:${regexString})*$`)
        result = result.replace(regex, "")
    }
    return result
}

//
function trimWhiteSpaceAroundString(text) {
    // Create an NSString object from the text
    var alteredText = $(text)
    // Trim white space around the NSString and return the result
    var whitespace = $.NSCharacterSet.whitespaceCharacterSet
    return alteredText.stringByTrimmingCharactersInSet(whitespace).js
}