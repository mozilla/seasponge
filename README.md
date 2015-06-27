[SeaSponge](https://github.com/mozilla/seasponge)
=========

[![Gitter chat](https://badges.gitter.im/mozilla/seasponge.png)](https://gitter.im/mozilla/seasponge)
[![Build Status](https://travis-ci.org/mozilla/seasponge.svg)](https://travis-ci.org/mozilla/seasponge)

-----

## About

SeaSponge is an accessible web-based threat modeling tool. This web-based application is being developed with three characteristics in mind:

- **Accessibility**: We want everyone to be able to map out their infrastructures and generate security reports on any operating-system and on any browser.
- **Aesthetics**: We're tired of clunky, boring interfaces - we want to bring the pizazz into threat-modeling.
- **Intuitive User-Experience**: We hate manuals, and we want you to be able to use this software without one.

Please see http://mozilla.github.io/seasponge/ for a live demo of the application.  
There is also a video on Air Mozilla available at https://air.mozilla.org/mozilla-winter-of-security-seasponge-a-tool-for-easy-threat-modeling/

### Example Threat Model developed with SeaSponge

Here is a share link for the SeaSponge threat model we developed in our [Air Mozilla demo video](https://air.mozilla.org/mozilla-winter-of-security-seasponge-a-tool-for-easy-threat-modeling/): http://goo.gl/Q8mt0T

### Usage

See our [`Usage` page in our Wiki](https://github.com/mozilla/seasponge/wiki/Usage) for more details.

![usage_demo](https://cloud.githubusercontent.com/assets/5893112/6827282/55cf9060-d2e5-11e4-802f-7663719ee873.gif)

## Authors

- [Mathew Kallada](https://github.com/kallada)
- [Glavin Wiechert](https://github.com/Glavin001)
- [Joel Kuntz](https://github.com/Frozenfire92)
- [Sarah MacDonald](https://github.com/rainbee2214)

With Mozilla Advisor [Curtis Koenig](https://mozillians.org/en-US/u/curtisk/)
and Professor [Dr. Pawan Lingras](http://cs.stmarys.ca/~pawan/)

## Contributing

Please see our [Contributing Guidelines](CONTRIBUTING.md)


#### Dependencies

You may need to prefix commands with `sudo`

- [Node.js](http://nodejs.org/)
  - [Bower](http://bower.io/) `npm install -g bower`
  - [Grunt](http://gruntjs.com/) `npm install -g grunt-cli`
  - [Yeoman](http://yeoman.io/) `npm install -g yo`
    - [AngularJS Generator](https://github.com/yeoman/generator-angular) `npm install -g generator-angular`
- [Ruby](https://www.ruby-lang.org/en/installation/)
  - Linux users may also need `ruby-dev` via `sudo apt-get install ruby-dev`
  - [Sass](http://sass-lang.com/install) `gem install sass`
  - [Compass](http://compass-style.org/install/) >=0.12.2 `gem install compass`

After forking and cloning the repository in the location of your choice run the following commands to install your [Node.js](http://nodejs.org/) and [Bower](http://bower.io/) dependencies.

```bash
npm install
bower install
```

#### Building

Once you have the application and dependencies installed you can start building the app.

```bash
# Previews the app on a local server
grunt serve

# Builds the application to dist/
grunt build
```

#### Documentation

```bash
# Build docs to docs/
grunt docs

# Build docs and serve docs/ for web browser
grunt serve:docs
```

#### Developing

Please see the [Development Guide](DEVGUIDE.md)

## Links

- [Mozilla Wiki Page](https://wiki.mozilla.org/Security/Mentorships/MWoS/2014/online_threat_modeling_tool)
- [GitHub Project Wiki](https://github.com/mozilla/seasponge/wiki)
