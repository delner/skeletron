# Skeletron

Skeletron is library to aid the building of Ruby applications on "use-case-driven" architecture.

### What is "use-case-driven" (UCD) architecture?

!["Use-case-driven" architecture](https://github.com/delner/skeletron/raw/master/architecture_diagram.png)

**Robert Martin describes the architecture in his "Architecture: The Lost Years" lecture**:

[!["Architecture: The Lost Years"](https://img.youtube.com/vi/WpkDN78P884/0.jpg)](https://www.youtube.com/watch?v=WpkDN78P884)

https://www.youtube.com/watch?v=WpkDN78P884

**This architecture aims to address some common problems in modern Ruby applications**:

 - Web-layer coupling with application-layer logic.
 - Application-layer coupling with  database implementation.
 - Complicated and expensive unit testing that results from this coupling.

**And to this end, emphasizes a few key points**:

 - HTTP/Web/Rails is a delivery mechanism
 - Database is a detail; not any integral part of the intent of the applicaiton itself.
 - A good architecture allows major decisions to be deferred: e.g. choosing a database.
 - A good architecture maximizes the number of decisions *NOT* made.
  - So you can decide those later and plug them in to fit business needs or respond to changes in business logic.

#### Key components

  - **Entities**
    
    Generic business objects & rules, agnostic to presentation or storage mechanisms (e.g. Order, Customer).

  - **Interactors**

    Application specific business rules; Manipulates the relevant data from the Request Model and interacts with the Entities.

  - **Boundaries & Gateways**

    Protocols or Interfaces for defining .

  - **Models**

    Dumb data structures representing input or output, without methods. e.g. Request Model, Response Model, View Model.

  - **Controllers**

    Convert the stuff submitted by the delivery mechanism into a delivery agnostic Request Model.

  - **Presenters**

    Turns the delivery agnostic Response Model into a prepared “viewified” data structure ready for easy manipulation by the view.

### Mission statement

Skeletron aims to:

  - **Provide modules to aid implemention UCD architecture**: They are optional and composable, so you can implement only what you want.
  - **Favor simplicity over convention**: In order to promote extensibility and modularity to give the author maximum freedom.

It is **NOT**:

  - **An application framework in itself** e.g. Rails; it's an application library.
  - **"Opinionated"**: it's here to aid your architecture choices, not constrain.

### Quickstart

*TODO*

#### Available features

*TODO*

### Contributing

*TODO*
