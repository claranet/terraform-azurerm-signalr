## 6.1.0 (2024-10-03)

### Features

* use Claranet "azurecaf" provider 6d494d0

### Documentation

* update README badge to use OpenTofu registry 65d5b1b
* update README with `terraform-docs` v0.19.0 b531d94

### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] a357647
* **AZ-1391:** update semantic-release config [skip ci] 5457dc0

### Miscellaneous Chores

* **deps:** add renovate.json b70aee3
* **deps:** enable automerge on renovate 2226688
* **deps:** update dependency opentofu to v1.7.0 7bdb08d
* **deps:** update dependency opentofu to v1.7.1 e4c9814
* **deps:** update dependency opentofu to v1.7.2 3650d43
* **deps:** update dependency opentofu to v1.7.3 01dd50b
* **deps:** update dependency opentofu to v1.8.1 bee401d
* **deps:** update dependency opentofu to v1.8.2 f4089b2
* **deps:** update dependency pre-commit to v3.7.1 4420585
* **deps:** update dependency pre-commit to v3.8.0 e82dc5e
* **deps:** update dependency terraform-docs to v0.18.0 fbaa9a1
* **deps:** update dependency terraform-docs to v0.19.0 9b31581
* **deps:** update dependency tflint to v0.51.0 bbe990a
* **deps:** update dependency tflint to v0.51.1 43d6ff8
* **deps:** update dependency tflint to v0.51.2 a1ccbeb
* **deps:** update dependency tflint to v0.52.0 f5f0fb9
* **deps:** update dependency tflint to v0.53.0 7868abf
* **deps:** update dependency trivy to v0.50.2 3d4425e
* **deps:** update dependency trivy to v0.50.4 fc71d02
* **deps:** update dependency trivy to v0.51.0 6afc6fa
* **deps:** update dependency trivy to v0.51.1 fcf4d52
* **deps:** update dependency trivy to v0.51.2 ed51d9c
* **deps:** update dependency trivy to v0.51.4 84e6a38
* **deps:** update dependency trivy to v0.52.0 e9e5037
* **deps:** update dependency trivy to v0.52.1 76fe739
* **deps:** update dependency trivy to v0.52.2 f673c78
* **deps:** update dependency trivy to v0.53.0 31c7753
* **deps:** update dependency trivy to v0.55.0 a51cf98
* **deps:** update dependency trivy to v0.55.1 5585dc7
* **deps:** update dependency trivy to v0.55.2 48ec763
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 459ff54
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 f3e08a1
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 252a65e
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 f902301
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.2 65970a2
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 258e745
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 127b921
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 ac1b3bf
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 9441aad
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 2efcba2
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 9626621
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 351e028
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 6f45860
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 df9caff
* **deps:** update renovate.json 3738825
* **deps:** update tools dc49e38
* **pre-commit:** update commitlint hook e0ce991
* **release:** remove legacy `VERSION` file 4dfb3fb

# v6.0.0 - 2023-06-02

Breaking
  * AZ-1089: Bump minimum Terraform version to `1.1`

Added
  * AZ-1089: Option to enable the public access

# v5.1.0 - 2022-11-23

Changed
  * AZ-908: Use the new data source for CAF naming (instead of resource)

# v5.0.0 - 2022-03-31

Breaking
  * AZ-515: Option to use Azure CAF naming provider to name resources
  * AZ-515: Require Terraform 0.13+

# v4.2.0 - 2022-03-18

Added
  * AZ-615: Add an option to enable or disable default tags

# v4.1.0 - 2022-01-21

Changed
  * AZ-572: Revamp examples and improve CI
  * AZ-658: Fix deprecated `features` variable

# v4.0.2 - 2021-08-27

Changed
  * AZ-532: Revamp README with latest `terraform-docs` tool

# v4.0.1 - 2021-01-08

Fixed
  * AZ-401: Fix cors block

# v3.0.0/v4.0.0 - 2020-11-18

Added
  * AZ-355: Initial release
