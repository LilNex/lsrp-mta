languages = {
	"English",
	"Russian",
	"German",
	"French",
	"Dutch",
	"Italian",
	"Spanish",
	"Gaelic",
	"Japanese",
	"Chinese",
	"Arabic",
	"Norwegian",
	"Swedish",
	"Danish",
	"Welsh",
	"Hungarian",
	"Bosnian",
	"Somalian",
	"Finnish",
	"Georgian",
	"Greek",
	"Polish",
	"Portuguese",
	"Turkish",
	"Estonian",
	"Korean",
	"Vietnamese",
	"Romanian",
	"Albanian",
	"Lithuanian",
	"Serbian",
	"Croatian",
	"Slovak",
	"Hebrew",
	"Persian",
	"Gibberish",
	"Latvian",
	"Bulgarian",
	"Armenian",
}
	
flags = {
	"gb",
	"ru",
	"de",
	"fr",
	"nl",
	"it",
	"es",
	"sc",
	"ja",
	"cn",
	"af",
	"no",
	"se",
	"dk",
	"gb",
	"hu",
	"bo",
	"so",
	"fi",
	"gy",
	"eu",
	"pl",
	"pr",
	"eu",
	"ee",
	"kr",
	"vn",
	"ro",
	"al",
	"lt",
	"sb", 
	"ct",
	"sl",
	"il",
	"af",
	"gi",
	"lv",
	"bg",
	"arm",
}


function getLanguageName(language)
	return languages[language] or '<Invalid/Bugged Language>'
end

function getLanguageCount()
	return #languages
end

function getLanguageList()
	return languages
end