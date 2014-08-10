[SeaSponge](https://github.com/mozilla/seasponge)
=========

[![Gitter chat](https://badges.gitter.im/mozilla/seasponge.png)](https://gitter.im/mozilla/seasponge)
[![Build Status](https://travis-ci.org/mozilla/seasponge.svg)](https://travis-ci.org/mozilla/seasponge)

> SeaSponge is an accessible web-based threat modelling tool developed for [Mozilla Winter of Security 2014](https://wiki.mozilla.org/Security/Automation/WinterOfSecurity2014).

-----

## About

This web-based application is being developed with three characteristics in mind:

- **Accessibility**: We want everyone to be able to map out their infastructures and generate security reports on any operating-system and on any browser.
- **Aesthetics**: We're tired of clunky, boring interfaces - we want to bring the pizazz into threat-modeling.
- **Intuitive User-Experience**: We hate manuals, and we want you to be able to use this software without one.

## Authors

- [Mathew Kallada](https://github.com/kallada)
- [Glavin Wiechert](https://github.com/Glavin001)
- [Joel Kuntz](https://github.com/Frozenfire92)
- [Sarah MacDonald](https://github.com/rainbee2214)

With Mozilla Advisor [Curtis Koenig](https://mozillians.org/en-US/u/curtisk/)
and Professor [Dr. Pawan Lingras](http://cs.stmarys.ca/~pawan/)

## Contributing

Please use issue branches and submit [Pull Requests](https://help.github.com/articles/using-pull-requests) for review.  
Your commit messages should [AngularJS Git Commit Message Conventions](https://docs.google.com/document/d/1QrDFcIiPjSLDn3EL15IJygNPiHORgU1_OOAqWjiDU5Y/edit).

### Getting Started


#### Installing Dependencies

After cloning the repository in the location of your choice run the following commands in your Terminal:

```
npm install
bower install
```

This will install your [Node.js](http://nodejs.org/) and [Bower](http://bower.io/) dependencies.

We use [grunt-contrib-compass](https://github.com/gruntjs/grunt-contrib-compass)
which requires you to have
[Ruby](https://www.ruby-lang.org/en/downloads/),
[Sass](http://sass-lang.com/guide),
and [Compass](http://compass-style.org/install/) >=0.12.2 installed.

Please verify you have those installed (see https://github.com/gruntjs/grunt-contrib-compass#compass-task)
or you may receive the following error message when building:

```
Warning: Running "compass:dist" (compass) task
Warning: You need to have Ruby and Compass installed and in your system PATH for this task to > work. More info: https://github.com/gruntjs/grunt-contrib-compass Use --force to continue.
```

#### Building

Once you have the app dependencies installed you can start building the app.

We use [Grunt](http://gruntjs.com/). Please verify you have it installed.

Run `grunt` for building and `grunt serve` for previewing your app locally.

#### Developing

We recommend you use the [sub-generators provided](https://github.com/yeoman/generator-angular#generators)
by [generator-angular](https://github.com/yeoman/generator-angular).  
Remember to follow the proper commit messages conventions: [AngularJS Git Commit Message Conventions](https://docs.google.com/document/d/1QrDFcIiPjSLDn3EL15IJygNPiHORgU1_OOAqWjiDU5Y/edit).

## Links

- [Mozilla Wiki Page](https://wiki.mozilla.org/Security/Mentorships/MWoS/2014/online_threat_modeling_tool)
- [GitHub Project Wiki](https://github.com/mozilla/seasponge/wiki)
