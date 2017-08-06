var app = Application.currentApplication()
app.includeStandardAdditions = true
 
function displayError(errorMessage) {
    var response = app.displayDialog(errorMessage, {
        buttons: ["Don't Continue", "Continue"],
        defaultButton: "Continue"
    })
    var buttonChoice = response.buttonReturned
    if (buttonChoice == "Continue")
        return true
    else
        return false
}

/*function run() {
    var app = Application.currentApplication()
    app.includeStandardAdditions = true
    app.displayDialog("The script is running.")
}*/

function quit() {
    app.displayDialog("The script is quitting.")
}

textProcessor = Library("Text Processor")

try {
	// Do something
	iTunes = Application('iTunes')
	} catch (error) {
    	// Notify the user that there's a problem
    	if (displayError("Error opening iTunes App") ){
         	// Continue processing
		} else {
	    	// Stop processing
		}
	}

var selection = iTunes.selection();
if (selection.length > 0) 
{    
	for (var i in selection) 
	{
		var ArtistSong = selection[i].name()
		ArtistSong = ArtistSong.replace(/_/g, " ")
		var strSplit = ArtistSong.split("-")
		if (strSplit.length == 4) 
		{
			var txt = textProcessor.trimText(strSplit[0]+ " " + strSplit[1], "(", "both")
			txt = textProcessor.trimText(txt, ")", "both")
			app.displayDialog( txt + "!" + strSplit[2] + "!" + strSplit[3], {givingUpAfter: 1})
			selection[i].album = txt
			selection[i].name = strSplit[3]
			//selection[i].artist = strSplit[4]
			selection[i].trackNumber = Number(strSplit[2])
		}
		else 
		{
			app.say("Error", {
					    using: "Alex",
					    speakingRate: 140,
					    pitch: 42,
					    modulation: 60 }) 
		app.displayDialog("Error", {givingUpAfter: 2})
		}
		app.say("Ok all done", {
					    using: "Alex",
					    speakingRate: 140,
					    pitch: 42,
					    modulation: 60 }) 	}
}

//var fruitChoices = ["Apple", "Banana", "Orange"]
//var favoriteFruit = app.chooseFromList(fruitChoices, {
//    withPrompt: "Select your favorite fruit:",
//    defaultItems: ["Apple"]
//})