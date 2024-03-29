{% from "apache/map.jinja" import apache with context %}

apache_restart:
  module.wait:
    - name: service.restart
    - m_name: {{ apache.service }}
    - onchanges:
      - apache_configuration
      {% if grains ['os_family'] =="Debian" %}
      - apache_envvars
      {% endif %}
 
