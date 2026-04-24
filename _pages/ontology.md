---
permalink: /ontology
layout: default
title: Volunteering and Social Action Ontology
---


<nav class="toc numbered-toc">
<h2 id="table-of-contents">Table of Contents</h2>

1. TOC
{:toc}

</nav>

<article class="numbered-headings">

## Introduction


<p>The volunteering and social action ontology can be <a href="/webvowl/#opts=doc=0;filter_sco=true;mode_compact=true">visualized through WebVOWL</a>, a web-based ontology visualization tool.</p>

<p>The volunteering and social action ontology is implemented using RDF, a native data format for the semantic web. RDF enables the <a href="https://5stardata.info/en/">5-star</a> deployment scheme for Open Data; a scheme suggested by Tim Berners-Lee, the inventor of the Web and <a href="https://www.w3.org/DesignIssues/LinkedData.html">Linked Data</a> initiator.</p>


## Volunteering Data Model

<p>The following diagram illustrates the main elements of the Volunteering and Social Action Ontology.</p>

<p class="data-model-diagram"><img src="/assets/img/volunteering-data-model.svg" alt="Volunteering Data Model" title="Volunteering Data Model" /></p>


### Organisation

<p>Any organisation running activities that involve volunteers.</p>

#### Properties

<span id="organisation-name">name</span>
: The organisation's name.

<span id="organisation-description">description</span>
: A description of the organisation.

<span id="organisation-website">website</span>
: The URL of the organisation's website.

<span id="organisation-image">image</span>
: An image representing the organisation (e.g. logo or photo).

<span id="organisation-activity">activity</span>
: A volunteering opportunity offered by the organisation.

<span id="organisation-cause">cause</span>
: A charitable cause the organisation is involved with. See the <a href="/ontology/cause">Charitable Cause Taxonomy</a>.

<span id="organisation-charity-number">charityRegistration</span>
: The charity registration number and registrar. See also UK charity registration authorities: <a href="https://www.charitycommissionni.org.uk/">The Charity Commission for Northern Ireland</a>; <a href="https://www.oscr.org.uk/about-charities/">Office of the Scottish Charity Regulator (OSCR)</a>; <a href="https://register-of-charities.charitycommission.gov.uk/">Charity Commission for England and Wales</a>.

<span id="charity-registration-registrar">registrar</span>
: The charity registration authority.

<span id="charity-registration-registration-number">registrationNumber</span>
: The charity registration number.

#### Example

<div class="example">
  <h5 id="example-1">Example 1</h5>
{% highlight json %}
{
  "@context": "https://api.volunteeringdata.io/context/v1",
  "type": "Organisation",
  "id": "https://example.org/organisation/oxfam-gb",
  "name": "Oxfam",
  "description": "Oxfam is a global movement of people working together to end the injustice of poverty.",
  "website": "https://www.oxfam.org.uk/",
  "charityNumber": "202918",
  "image": "https://example.org/images/oxfam-logo.png",
  "cause": [
    "https://ns.volunteeringdata.io/AntiPoverty",
    "https://ns.volunteeringdata.io/CivilRights"
  ],
  "activity": [
    ... (see activity example)
  ],
  "charityRegistration": [
    {
      "registrar": "https://register-of-charities.charitycommission.gov.uk",
      "registrationNumber": "202918"
    },
    {
      "registrar": "https://www.oscr.org.uk",
      "registrationNumber": "SC039042"
    },
    {
      "registrar": "https://www.charitycommissionni.org.uk",
      "registrationNumber": "100848"
    }
  ]
}
{% endhighlight %}
</div>


<div class="note">
  <h5 id="note-1">Note 1</h5>
  <p>One charity can register with multiple charity number registries.</p>
  <p>For example, Oxfam is registered with:</p>
  <ul>
    <li>The Charity commission for England and Wales as <a href="https://register-of-charities.charitycommission.gov.uk/en/charity-search/-/charity-details/202918">202918</a></li>
    <li>The OSCR as <a href="https://www.oscr.org.uk/about-charities/search-the-register/charity-details?number=SC039042">SC039042</a></li>
    <li>The Charity commission for Northern Ireland as <a href="https://www.charitycommissionni.org.uk/charity-search/charity-details-page/?regId=100848&subId=0">100848</a></li>
  </ul>
</div>

### Activity

<p>Any kind of activity that involves volunteers.</p>

#### Properties

<span id="activity-title">title</span>
: The activity's title.

<span id="activity-description">description</span>
: A description of the activity.

<span id="activity-requires-emergency-participation">requiresEmergencyParticipation</span>
: Whether the activity requires emergency participation (boolean).

<span id="activity-image">image</span>
: An image representing the activity.

<span id="activity-publish-start">publishStart</span>
: The date at which publication of the activity must start.

<span id="activity-publish-end">publishEnd</span>
: The date at which publication of the activity must end.

<span id="activity-organisation">organisation</span>
: The organisation running the activity.

<span id="activity-role">role</span>
: A volunteer role associated with the activity.

<span id="activity-session">session</span>
: A session when the activity takes place.

#### Example

<div class="example">
  <h5 id="example-2">Example 2</h5>
{% highlight json %}
{
  "@context": "https://api.volunteeringdata.io/context/v1",
  "id": "https://id.volunteeringdata.io/686e542f7734eb69b0ec1516",
  "type": "Activity",
  "title": "Volunteer Skywalker",
  "description": "Help distribute food, drink, and much-needed essential supplies to those who don't have a safe place to call home.",
  "publishEnd": "2026-08-28",
  "organisation": "https://id.volunteeringdata.io/684059665d271835a2253c9d",
  "role": {
    "applyLink": "https://underoneskytogether.com/get-involved/join-us",
    "minimumAge": "16"
  },
  "session": {
    "location": [
      {
        "address": "127-128 Lower Marsh, London SE1 7AE, UK",
        "latitude": "51.5005014",
        "longitude": "-0.1136474"
      }
    ],
    "time": [
      "volunteering:MondayAfternoon",
      "volunteering:TuesdayAfternoon",
      "volunteering:SaturdayMorning",
      "https://ns.volunteeringdata.io/SaturdayAfternoon"
    ]
  }
}
{% endhighlight %}
</div>

<div class="note">
  <h5 id="note-2">Note 2</h5>
  <p>In example 2, the organisation is referred to through its identifier. It is also possible to embed the organisation details in the activity representation.</p>
  <p>Standard-defined <a href="#time-defined-temporal-entities">temporal entities</a> can be referred to via their <a href="https://en.wikipedia.org/wiki/CURIE">compact URI</a> (using the "volunteering" prefix). That is: "volunteering:TuesdayMorning" is equivalent to "https://ns.volunteeringdata.io/TuesdayMorning".</p>
  <p>New temporal entities can be defined using the <a href="https://www.w3.org/TR/owl-time/">Time ontology in OWL</a>. See for example <a href="https://api.volunteeringdata.io/describe.ttl?id=https://ns.volunteeringdata.io/TuesdayMorning">Tuesday Morning</a>.</p>
  <p>While URLs are preferable for identifiers because the data is then authoritative and can be <a href="https://www.w3.org/wiki/LinkedData">dereferenced</a> at source, <a href="https://www.ietf.org/rfc/rfc4122.txt">urn:uuid:</a> identifiers can be used too.</p>
</div>


### Role

<p>Any kind of role related to a volunteering activity.</p>

#### Properties

<span id="role-title">title</span>
: The role's title.

<span id="role-description">description</span>
: A description of the role.

<span id="role-commitment">commitment</span>
: The time commitment expected for the role.

<span id="role-apply-link">applyLink</span>
: A link to apply for the role.

<span id="role-allows-remote-participation">allowsRemoteParticipation</span>
: Whether the role allows remote participation (boolean).

<span id="role-minimum-age">minimumAge</span>
: The minimum age requirement for the role.

<span id="role-maximum-age">maximumAge</span>
: The maximum age requirement for the role.

<span id="role-activity">activity</span>
: The activity this role is part of.

<span id="role-accessibility">accessibility</span>
: Accessibility information for the role.

<span id="role-requirement">requirement</span>
: A requirement for the role. See the <a href="/ontology/requirement">Requirement Taxonomy</a>.

<span id="role-reward">reward</span>
: A reward associated with the role.

<span id="role-skill">skill</span>
: A skill associated with the role. See the <a href="/ontology/skill">Skill Taxonomy</a>.

#### Example

<div class="example">
  <h5 id="example-3">Example 3</h5>
{% highlight json %}
{
  "@context": "https://api.volunteeringdata.io/context/v1",
  "type": "Role",
  "id": "https://example.org/role/outreach-volunteer",
  "title": "Outreach Volunteer",
  "description": "Walk set routes to engage with people sleeping rough, offering food, warm clothing, and signposting to support services.",
  "commitment": "One evening per week, 3-hour shift",
  "applyLink": "https://underoneskytogether.com/get-involved/join-us",
  "allowsRemoteParticipation": false,
  "minimumAge": "18",
  "activity": "https://id.volunteeringdata.io/686e542f7734eb69b0ec1516",
  "requirement": [
    "https://ns.volunteeringdata.io/DBSCheck"
  ],
  "reward": [
    "https://ns.volunteeringdata.io/TrainingProvided",
    "https://ns.volunteeringdata.io/ExpensesReimbursed"
  ],
  "skill": [
    "https://ns.volunteeringdata.io/Communication",
    "https://ns.volunteeringdata.io/EmpathyAndCompassion"
  ]
}
{% endhighlight %}
</div>


### Session

<p>A session describes a time and place for an activity that involves volunteers.</p>

#### Properties

<span id="session-activity">activity</span>
: The activity this session is for.

<span id="session-location">location</span>
: The location where the session takes place.

<span id="session-time">time</span>
: The time when the session occurs.

#### Example

<div class="example">
  <h5 id="example-4">Example 4</h5>
{% highlight json %}
{
  "@context": "https://api.volunteeringdata.io/context/v1",
  "type": "Session",
  "activity": "https://id.volunteeringdata.io/686e542f7734eb69b0ec1516",
  "location": {
    "name": "Under One Sky Hub",
    "address": "127-128 Lower Marsh, London SE1 7AE, UK",
    "latitude": "51.5005014",
    "longitude": "-0.1136474"
  },
  "time": "https://ns.volunteeringdata.io/MondayAfternoon"
}
{% endhighlight %}
</div>

<div class="note">
  <h5 id="note-3">Note 3</h5>
  <p>Sessions typically do not have an <code>id</code> attribute of their own, as they will generally be presented embedded within the context of an activity (see <a href="#activity-example">Example 2</a>).</p>
</div>


### Location

<p>Any location related to volunteering activities.</p>

#### Properties

<span id="location-name">name</span>
: A name for the location.

<span id="location-address">address</span>
: The location's address as free text. This can be a partial (e.g. postcode) or full address.

<span id="location-geometry">geometry</span>
: A generic geometry object to support interfaces common to all geographically referenced geometric objects. Sub-property of <a href="https://docs.ogc.org/is/22-047r1/22-047r1.html#_property_geohasgeometry">geosparql:hasGeometry</a>. See the <a href="https://docs.ogc.org/is/22-047r1/22-047r1.html">GeoSPARQL standard</a>.

<span id="location-latitude">latitude</span>
: The location's latitude in decimal degree. Sub-property of <a href="http://www.w3.org/2003/01/geo/wgs84_pos#lat">geo:lat</a>. See <a href="https://www.w3.org/2003/01/geo/wgs84_pos">WGS84 Geo Positioning</a>.

<span id="location-longitude">longitude</span>
: The location's longitude in decimal degree. Sub-property of <a href="http://www.w3.org/2003/01/geo/wgs84_pos#lat">geo:long</a>. See <a href="https://www.w3.org/2003/01/geo/wgs84_pos">WGS84 Geo Positioning</a>.

<span id="location-session">session</span>
: A session that takes place at this location.

#### Example

<div class="example">
  <h5 id="example-5">Example 5</h5>
{% highlight json %}
{
  "@context": "https://api.volunteeringdata.io/context/v1",
  "type": "Location",
  "name": "Under One Sky Hub",
  "address": "127-128 Lower Marsh, London SE1 7AE, UK",
  "latitude": "51.5005014",
  "longitude": "-0.1136474"
}
{% endhighlight %}
</div>

<div class="note">
  <h5 id="note-4">Note 4</h5>
  <p>Locations could be predefined and reused. For example, a council's boundary can be serialised as <a href="https://en.wikipedia.org/wiki/Well-known_text_representation_of_geometry">Well-Known Text (WKT)</a> and linked to via the <code>geometry</code> property. The <a href="https://docs.ogc.org/is/22-047r1/22-047r1.html">GeoSPARQL standard</a> defines how to link geometries to <a href="https://docs.ogc.org/is/22-047r1/22-047r1.html#C.1.1.2.2">WKT literals</a>. For an example of such a boundary, see the <a href="https://mapit.mysociety.org/area/2508.html">geometry of the Hackney Borough Council</a>.</p>
</div>

<div class="example">
  <h5 id="example-6">Example 6</h5>
{% highlight json %}
{
  "@context": "https://api.volunteeringdata.io/context/v1",
  "type": "Location",
  "name": "Aberdeen",
  "geometry": {
    "geosparql:asWKT": "MULTIPOLYGON (((385726.9995 815937.7998, 385745.5014 ... 395720.5 801236.85, 395721 801236.8, 395721.2 801236.6)))"
  }
}
{% endhighlight %}
</div>


### Time

<p>Any time information related to volunteering activities modeled as a OWL time temporal entity.</p>

#### Properties

<span id="time-label">rdfs:label</span>
: The temporal entity's name. See <a href="https://www.w3.org/TR/owl-time/#time:TemporalEntity">OWL Time Temporal Entity</a>.

<span id="time-beginning">time:hasBeginning</span>
: The beginning of a period of time. See <a href="https://www.w3.org/TR/owl-time/#time:hasBeginning">OWL Time has beginning</a>.

<span id="time-end">time:hasEnd</span>
: The end of a period of time. See <a href="https://www.w3.org/TR/owl-time/#time:hasEnd">OWL Time has end</a>.

#### Defined temporal entities

<span id="time-monday-morning">MondayMorning</span>
: The time period between 6am and 12pm on Monday.

<span id="time-monday-afternoon">MondayAfternoon</span>
: The time period between 12pm and 6pm on Monday.

<span id="time-monday-evening">MondayEvening</span>
: The time period between 6pm and 12am on Monday.

<span id="time-tuesday-morning">TuesdayMorning</span>
: The time period between 6am and 12pm on Tuesday.

<span id="time-tuesday-afternoon">TuesdayAfternoon</span>
: The time period between 12pm and 6pm on Tuesday.

<span id="time-tuesday-evening">TuesdayEvening</span>
: The time period between 6pm and 12am on Tuesday.

<span id="time-wednesday-morning">WednesdayMorning</span>
: The time period between 6am and 12pm on Wednesday.

<span id="time-wednesday-afternoon">WednesdayAfternoon</span>
: The time period between 12pm and 6pm on Wednesday.

<span id="time-wednesday-evening">WednesdayEvening</span>
: The time period between 6pm and 12am on Wednesday.

<span id="time-thursday-morning">ThursdayMorning</span>
: The time period between 6am and 12pm on Thursday.

<span id="time-thursday-afternoon">ThursdayAfternoon</span>
: The time period between 12pm and 6pm on Thursday.

<span id="time-thursday-evening">ThursdayEvening</span>
: The time period between 6pm and 12am on Thursday.

<span id="time-friday-morning">FridayMorning</span>
: The time period between 6am and 12pm on Friday.

<span id="time-friday-afternoon">FridayAfternoon</span>
: The time period between 12pm and 6pm on Friday.

<span id="time-friday-evening">FridayEvening</span>
: The time period between 6pm and 12am on Friday.

<span id="time-saturday-morning">SaturdayMorning</span>
: The time period between 6am and 12pm on Saturday.

<span id="time-saturday-afternoon">SaturdayAfternoon</span>
: The time period between 12pm and 6pm on Saturday.

<span id="time-saturday-evening">SaturdayEvening</span>
: The time period between 6pm and 12am on Saturday.

<span id="time-sunday-morning">SundayMorning</span>
: The time period between 6am and 12pm on Sunday.

<span id="time-sunday-afternoon">SundayAfternoon</span>
: The time period between 12pm and 6pm on Sunday.

<span id="time-sunday-evening">SundayEvening</span>
: The time period between 6pm and 12am on Sunday.

#### Example

<div class="example">
  <h5 id="example-7">Example 7</h5>
{% highlight json %}
{
  "@context": "https://api.volunteeringdata.io/context/v1",
  "type": "Time",
  "rdfs:label": "Tuesday 2 to 4 pm",
  "time:hasBeginning": {
    "time:inDateTime": {
      "time:dayOfWeek": "time:Tuesday",
      "time:hour": 14
    }
  },
  "time:hasEnd": {
    "time:inDateTime": {
      "time:dayOfWeek": "time:Tuesday",
      "time:hour": 16
    }
  }
}
{% endhighlight %}
</div>

<div class="note">
  <h5 id="note-5">Note 5</h5>
  <p>User research shows that volunteering opportunities generally have flexible schedules. The predefined <a href="#time-defined-temporal-entities">temporal entities</a> defined in section 2.6.2 should be reused where possible.</p>
  <p>See for example the availability filter on <a href="https://volunteer.scot/search?keywords=clean&amp;location=&amp;lat=&amp;lon=&amp;display=list&amp;sort=relevance&amp;availability=monday-morning&amp;availability=wednesday-morning&amp;availability=tuesday-afternoon&amp;availability=wednesday-afternoon&amp;availability=friday-afternoon&amp;availability=saturday-afternoon&amp;availability=friday-evening">Volunteer Scotland's search</a>, which uses morning, afternoon, and evening slots per day of the week.</p>
</div>


## Taxonomies

* [Charitable Cause Taxonomy](/ontology/cause)
* [Requirement Taxonomy](/ontology/requirement)
* [Skill Taxonomy](/ontology/skill)

See also the [European Skills, Competences, Qualifications and Occupations (ESCO)](https://esco.ec.europa.eu/en/classification/skill_main).


## Sharing Opportunities Data

See <a href="/publishing-opportunities-data">sharing volunteering opportunities data</a> for guidance on how to share volunteering opportunities using this standard.



## AI Readiness

See <a href="/ai-readiness">AI-Ready Data</a> for guidance on machine-readable dataset and API descriptions that support AI use.



## Contributing Knowledge

We welcome domain experts and people with varied experiences of volunteering to contribute their knowledge of the sector to the Volunteering and Social Action Ontology. Shared knowledge is the basis to ensure our standard adequately provides structure to address the volunteering sector's needs.

### Discussion Topics

Please don't hesitate to contribute to the <a href="https://github.com/orgs/volunteeringdata/discussions/">discussions</a> on the volunteering data model repository.

We created 8 categories for focused discussions on specific modeling and requirements topics:

* <a href="https://github.com/orgs/volunteeringdata/discussions/categories/accessibility">Accessibility</a>
* <a href="https://github.com/orgs/volunteeringdata/discussions/categories/data-governance">Data Governance</a>
* <a href="https://github.com/orgs/volunteeringdata/discussions/categories/emergency-response">Emergency Response</a>
* <a href="https://github.com/orgs/volunteeringdata/discussions/categories/geographical-location">Geographical Location</a>
* <a href="https://github.com/orgs/volunteeringdata/discussions/categories/roles-and-skills">Roles and Skills</a>
* <a href="https://github.com/orgs/volunteeringdata/discussions/categories/value-typology">Value Mapping</a>
* <a href="https://github.com/orgs/volunteeringdata/discussions/categories/volunteer-involving-organisation">Volunteer Involving Organisation</a>
* <a href="https://github.com/orgs/volunteeringdata/discussions/categories/volunteering-opportunities">Volunteering Opportunities</a>


## Standardisation History

The data model's evolution is recorded as a <a href="/working-group/model-version/">series of versions</a>.

</article>
