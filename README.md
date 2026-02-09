# AL-Go Per Tenant Extension Template

This template repository can be used for managing Per-tenant Extensions (PTEs) for Business Central.

Please go to https://aka.ms/AL-Go to learn more.

## Features

### Customer Extension
This extension adds an `ExternalCustomerId` field to the Customer table (Table 18) in Business Central.

#### Field Details
- **Name**: ExternalCustomerId
- **Type**: Code[50]
- **Caption**: External Customer Id
- **Data Classification**: CustomerContent

#### Implementation
The field is available in:
- **Customer Card** (Page 21) - Added in the General group after the No. field
- **Customer List** (Page 22) - Added as a column after the No. field

This allows you to store and track external customer identifiers from other systems.

## Contributing

Please read [this](https://github.com/microsoft/AL-Go/blob/main/Scenarios/Contribute.md) description on how to contribute to AL-Go for GitHub.

We do not accept Pull Requests on the template repository directly.

