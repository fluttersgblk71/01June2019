# Flutter Hackathon 2019 @ Block71, Singapore


# Welcome to: Amigo!
![amigo](https://user-images.githubusercontent.com/51255469/58746816-5a361c80-8495-11e9-91c1-43e7cf7144cb.JPG)

Helping you learn new language, one amigo at a time.

# Challenges faced learning new language
- Lacks human creativity
- Words not translated properly
- Lack of motivation
- Absense of native speaker to practise


# Our solution
- A Mobile/Desktop app which connects person 1 - fluent in language A and would like to learn language B, with person 2 - fluent in language B and would like to learn language A.
-Language translation to create flash cards for offline use

![ezgif-5-3ae3ea56f897](https://user-images.githubusercontent.com/51255469/58746897-68d10380-8496-11e9-8dbb-cc5a713d8387.gif)


# Stack
- Rakuten RapidAPI (langauge translation), SYSTRAN (https://english.api.rakuten.net/systran/api/systran-io-translation-and-nlp)
- Agora (Video services)
- Firebase (Database)
- Facebook/Google authentication
- Flair (Animation)

## Demo on the usage of the API

```javascript
*************************************************
******************Rakuten API********************
*************************************************
https://english.api.rakuten.net/systran/api/systran-io-translation-and-nlp
*************************************************
******************Rakuten API********************
*************************************************

*************************************************
*******************Parameters********************
*************************************************
source:en
target:
	ja => japan
	zh => chinese
	es => spanish
	ur => urdu
	hi => hindi
	ms => malay
input: word want to translate
*************************************************
*******************Parameters********************
*************************************************

*************************************************
*********************SNIPPET*********************
*************************************************
unirest.get("https://systran-systran-platform-for-language-processing-v1.p.rapidapi.com/translation/text/translate?source=en&target=ja&input=eat")
.header("X-RapidAPI-Host", "systran-systran-platform-for-language-processing-v1.p.rapidapi.com")
.header("X-RapidAPI-Key", "f44cdd85f1msh866a45a911bde67p128d2cjsnb2c67a1ff602")
.end(function (result) {
  console.log(result.status, result.headers, result.body);
});
*************************************************
*********************SNIPPET*********************
*************************************************
```

