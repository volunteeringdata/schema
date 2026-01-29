---
layout: default
title: Technical FAQ
---

1. What properties are required for a volunteering activity?
   > An activity MUST have an organisation, a label, and a description.
1. If an activity has no Location, it is remote?
   > An activity with no location might be remote but it is possible that location information is held in the activity's description.
    1. How to know with certainty if an activity is remote?
       > An activity that accomodates remote participation should have the property `allowsRemoteParticipation` set to true.
1. How to know if an activity is part of an emergency response effort?
   > An emergency response activity should have the property `requiresEmergencyParticipation` set to true.
