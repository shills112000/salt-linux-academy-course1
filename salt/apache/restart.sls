{% from "apache/map.jinja" import apache with context %}

apache_restart:
  module.wait:
    - name: service.restart
    - m_name: {{ apache.package }}
    - onchanges:
      - apache_configuration
