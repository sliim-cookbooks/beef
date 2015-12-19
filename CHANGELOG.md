beef CHANGELOG
==============

This file is used to list changes made in each version of the BeEF cookbook.

0.3.0
-----
- New recipe: `beef::service` to install and enable BeEF service
- Do not install ruby, use the ruby embedded with Chef by default
- New attributes: `[beef][ruby_bin_dir]` and `[beef][group]`
- Removed `nohup` process

###### Potential breaking changes
- Reviewed configuration template and attributes
- Set default attribute for BeEF 0.4.6.1-alpha (current)
- Removed useless apt packages.

0.2.0
-----
- Chef 12 compatibility
- Use Rake instead of Strainer
- Test hardness (rubocop, chefspec, kitchen)
- No cookbook dependencies

0.1.1
-----
- Attributes reorganization

0.1.0
-----
- Initial release of beef cookbook

