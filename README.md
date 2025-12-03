# Volunteering and Social Action Ontology

A [vocabulary](./vocabulary.ttl) to describe volunteering activities, volunteer-involving organisations and volunteering management systems.

## Versions

See [versions](./version/README.md).

## FAQ

1. What properties are required for a volunteering activity?
   > An activity MUST have an organisation, a label, and a description.
1. If an activity has no Location, it is remote?
   > An activity with no location might be remote but it is possible that location information is held in the activity's description.
    1. How to know with certainty if an activity is remote?
       > An activity that accomodates remote participation should have the property `allowsRemoteParticipation` set to true.
1. How to know if an activity is part of an emergency response effort?
   > An emergency response activity should have the property `requiresEmergencyParticipation` set to true.


## License

Unless otherwise specified, all content in this repository and any copies are subject to [Crown Copyright](http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/copyright-and-re-use/crown-copyright/) under the [Open Government License v3](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).

Any code is dual licensed under the MIT license and the Open Government License v3.
