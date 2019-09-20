{% if grains.get('testsuite') | default(false, true) %}
{% if grains.get('role') in ['client', 'minion', 'minionssh'] %}

include:
  - repos

{% if grains['os'] == 'SUSE' %}

default_cucumber_requisites:
  pkg.installed:
    - pkgs:
      - andromeda-dummy
      - milkyway-dummy
      - virgo-dummy
    - require:
      - sls: repos

{% elif grains['os_family'] == 'RedHat' %}

default_cucumber_requisites:
  pkg.installed:
    - pkgs:
      - andromeda-dummy
      - milkyway-dummy
      - virgo-dummy
    - require:
      - file: test_repo_rpm_pool

{% endif %}
{% endif %}
{% endif %}
