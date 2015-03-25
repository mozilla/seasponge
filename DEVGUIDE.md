# SeaSponge Developer Guidelines

## Dependencies & Building
See the [Readme](README.md) for an overview of the dependencies you need and basic usage of app locally

## Directory Overview
- [/app](app) Where the main Angular application lives
  - [/app/images](app/images) Any static images the app uses
  - [/app/scripts](app/scripts) Any coffeescripts for the app including controllers, stencils and services
  - [/app/styles](app/styles) Any Sass for the app
  - [/app/views](app/views) Any Angular HTML views
- [/test](test) Where the test files for the Karma test suite live

## Common Tasks

### Creating Angular stuff (Controllers, routes, etc.)
We recommend you use the [sub-generators provided](https://github.com/yeoman/generator-angular#generators)
by [generator-angular](https://github.com/yeoman/generator-angular).

### Creating a Stencil
1. Inside of [/app/scripts/stencils](app/scripts/stencils) Create a `stencilName.coffee` file in the appropriate category folder
2. Specify a new stencil's class name and what base stencil it extends. Don't forget to provide a name and an image. See [process.coffee](app/scripts/stencils/process/process.coffee) for an example
3. Add your new stencil to [/app/scripts/stencils/stencils.coffee](app/scripts/stencils/stencils.coffee)
4. Add the name of the corresponding compiled js to [app/index.html](app/index.html). Example `<script src="scripts/stencils/process/process.js"></script>`

