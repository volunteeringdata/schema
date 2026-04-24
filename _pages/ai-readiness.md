---
permalink: /ai-readiness
layout: default
title: AI-ready data
---

<nav id="toc" class="toc">
<h2 id="table-of-contents">Table of Contents</h2>

1. TOC
{:toc}

</nav>

For data to be AI-ready, it generally needs to be described in a machine-readable format.

This should address:
- the way by which the data is accessed (API)
- the shape of the data (Objects, Tabular, Files, Images...)
- the context in which the data can be used (license, provenance, usage permissions and restrictions)


## Machine Readable Data

### Standards

| Specification | Application |
|-|-|
| [OpenAPI Specification](https://spec.openapis.org/oas/latest.html) | API description |
| [DPROD](https://ekgf.github.io/dprod/) | Data Products and data services description |
| [Croissant 1.1 Format](https://docs.mlcommons.org/croissant/docs/croissant-spec-1.1.html) | ML dataset metadata standard |


### Corresponding Tools

| Tool | Application |
|-|-|
| [OpenAPI MCP Server](https://awslabs.github.io/mcp/servers/openapi-mcp-server) | OpenAPI MCP |
| [FastMCP](https://gofastmcp.com/integrations/openapi) | OpenAPI MCP |
| [Éclair](https://eclair-docs.github.io/) | Dataset MCP |


## See also

- [What’s New in Croissant 1.1: Extensible, Agent-Ready ML Dataset Standard](https://mlcommons.org/2026/02/croissant-1-1-standard/) (February 12, 2026)
- [Croissant Recordset Typing](https://docs.mlcommons.org/croissant/docs/croissant-spec-1.1.html#recordset-typing)
