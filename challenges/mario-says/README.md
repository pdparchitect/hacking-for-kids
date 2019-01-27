[![Follow on Twitter](https://img.shields.io/twitter/follow/pdp.svg?logo=twitter)](https://twitter.com/pdp)

# Mario Says

The purpose of this exercise is to show kids how software is built and how it can be modified with rudimentary tools such as HEX editors. The challenge is to replace what mario says with a different message. The default message is Hola! Soy super mario!".

![Mario Says](screenshots/01.png)

## Getting Started

The easiest and safest way to run the challenge is by using the prebuilt docker container. Make sure that you have docker installed in your environment. The exercise itself can be downloaded and executed directly from docker hub.

```
$ docker run -it pdparchitect/mario-says
```

Normally kids will not be able to solve the challenge by themeselves. You need to guide them. Here is a script of what you might want to say and show them:

* Tell them what programs are. You can say something along the lines of a sequence of numbers or a sequence of bits. Every number means something to the computer. The computer reads the number and knows what to do with it. Don't make it too complex.
* Tell them that programs are written in human-readable languages because it is very difficult for us to understand what each number is. So another program reads the program source and converts it to numbers. Again, keep it simple.
* You can say that sometimes you can change the numbers directly. Now we are getting into the interesting stuff.
* Pipe the program to xxd like this `xxd mario-says` and say that we can read now all the numbers of the program. Explain what these numbers are and point out the location of the text that we want to change.
* Open the program in tweak, which is provided in the docker image. Scroll to the relevant location and show them how to change the text so that the program can say something else.
* Save the program and execute again. If successful you will see a different message.
