## 8.0.2 (2026-02-13)

### Code Refactoring

* **gitlab MR template:** ♻️ update default reviewers group with Azure Factory 🔧 1e864ee

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.10.7 8aff999
* **deps:** update dependency opentofu to v1.11.2 62a3121
* **deps:** update dependency opentofu to v1.11.3 5f51d29
* **deps:** update dependency opentofu to v1.11.4 7084102
* **deps:** update dependency opentofu to v1.11.5 6ab53c1
* **deps:** update dependency pre-commit to v4.4.0 4cb9094
* **deps:** update dependency pre-commit to v4.5.0 cfa67f7
* **deps:** update dependency pre-commit to v4.5.1 b436cb9
* **deps:** update dependency tflint to v0.60.0 6b5f658
* **deps:** update dependency tflint to v0.61.0 851615a
* **deps:** update dependency trivy to v0.67.1 af4e70d
* **deps:** update dependency trivy to v0.67.2 b06ce1d
* **deps:** update dependency trivy to v0.68.1 85e7353
* **deps:** update dependency trivy to v0.68.2 7f962a7
* **deps:** update dependency trivy to v0.69.0 2c41659
* **deps:** update dependency trivy to v0.69.1 7113636
* **deps:** update pre-commit hook crate-ci/committed to v1.1.10 bcd7d14
* **deps:** update pre-commit hook crate-ci/committed to v1.1.8 fb5a1a0
* **deps:** update pre-commit hook crate-ci/committed to v1.1.9 083bb5f
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.2 861641a
* **deps:** update tools f331b11

## 8.0.1 (2025-10-01)

### Code Refactoring

* **deps:** 🔗 update claranet/azurecaf to ~> 1.3.0 🔧 a30923f

### Miscellaneous Chores

* **⚙️:** ✏️ update template identifier for MR review 7658e28
* 🗑️ remove old commitlint configuration files ffacc16
* **deps:** 🔗 bump AzureRM provider version to v4.31+ 7ac5380
* **deps:** update dependency claranet/diagnostic-settings/azurerm to ~> 8.1.0 ce97f7a
* **deps:** update dependency opentofu to v1.10.0 cc70aae
* **deps:** update dependency opentofu to v1.10.1 b224de6
* **deps:** update dependency opentofu to v1.10.3 fb78575
* **deps:** update dependency opentofu to v1.10.6 109d33d
* **deps:** update dependency opentofu to v1.9.1 dd45f0a
* **deps:** update dependency pre-commit to v4.2.0 30c98c6
* **deps:** update dependency terraform-docs to v0.20.0 cf2f6bb
* **deps:** update dependency tflint to v0.57.0 397d210
* **deps:** update dependency tflint to v0.58.0 ccc43bf
* **deps:** update dependency tflint to v0.58.1 9c4b0f9
* **deps:** update dependency tflint to v0.59.1 0bf6c88
* **deps:** update dependency trivy to v0.60.0 e736975
* **deps:** update dependency trivy to v0.61.1 454f61d
* **deps:** update dependency trivy to v0.62.0 fc2fcf6
* **deps:** update dependency trivy to v0.62.1 9bd44d6
* **deps:** update dependency trivy to v0.63.0 47b86e9
* **deps:** update dependency trivy to v0.66.0 3e97de4
* **deps:** update dependency trivy to v0.67.0 384a704
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.21.0 ecd5d4c
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.22.0 077b7a5
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v6 bbf2c90
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.0 6595057
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.2.1 76c598c
* **deps:** update terraform claranet/diagnostic-settings/azurerm to ~> 8.2.0 2c84eaa
* **deps:** update tools c3939ed
* **deps:** update tools 3c3fd3e
* **deps:** update tools 1ebe939
* **deps:** update tools 5d37691

## 7.0.0/8.0.0 (2025-02-07)

### ⚠ BREAKING CHANGES

* **AZ-1088:** AzureRM Provider v4+ and OpenTofu 1.8+

### Features

* **AZ-1088:** add diagnostic-settings 3d02f71
* **AZ-1088:** module v8 structure and updates dfddcf3
* **AZ-1088:** update resources 160c4b1

### Bug Fixes

* **AZ-1088:** change livetrace to block, change default `upstream_endpoint` to null 38177e1
* **AZ-1088:** fix example e5a7a55
* **AZ-1088:** fix variables ce1085f

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.3 691f66a
* **deps:** update dependency opentofu to v1.8.4 5337162
* **deps:** update dependency opentofu to v1.8.6 67b1e4f
* **deps:** update dependency opentofu to v1.8.8 5ea9d3f
* **deps:** update dependency opentofu to v1.9.0 3807647
* **deps:** update dependency pre-commit to v4 7d44979
* **deps:** update dependency pre-commit to v4.0.1 08c0187
* **deps:** update dependency pre-commit to v4.1.0 1ffcc0b
* **deps:** update dependency tflint to v0.54.0 83a334d
* **deps:** update dependency tflint to v0.55.0 8a1e1f1
* **deps:** update dependency tflint to v0.55.1 3f9c502
* **deps:** update dependency trivy to v0.56.1 8947304
* **deps:** update dependency trivy to v0.56.2 2c32f15
* **deps:** update dependency trivy to v0.57.1 82743c2
* **deps:** update dependency trivy to v0.58.1 94eb2fb
* **deps:** update dependency trivy to v0.58.2 0122c65
* **deps:** update dependency trivy to v0.59.0 2f66e43
* **deps:** update dependency trivy to v0.59.1 880e823
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.19.0 628e599
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.20.0 8c04133
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 4c3d109
* **deps:** update pre-commit hook tofuutils/pre-commit-opentofu to v2.1.0 581409f
* **deps:** update tools 2ac1291
* **deps:** update tools 2d91339
* prepare for new examples structure 6ef1ea8
* update examples structure 15f72f3
* update Github templates 86ae563
* update tflint config for v0.55.0 3dd4e66

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
