
# MERN Template

A boilerplate project for a MERN (MongoDB, Express, React, Node.js) stack application. This template provides a structured starting point with a React client and an Express server, along with automation scripts for setup and package management.




## Project Structure

Install my-project with npm

```bash
MERN-TEMPLATE/
├── client/                     # React application
├── server/                     # Express server
│   ├── controllers/            # Controllers for handling requests
│   ├── models/                 # Mongoose models
│   ├── routes/                 # API routes
│   ├── middlewares/            # Middleware functions
│   └── helpers/                # Helper functions
├── scripts/                    # Automation scripts
│   ├── dependencies/           # Dependency files
│   │   ├── clientPackages.txt  # Packages to install for the client
│   │   └── serverPackages.txt  # Packages to install for the server
│   │   └── dbConfigRequirements.txt  # Variables to past in .env server Directory
│   │   └── models.txt  # structure of models to create for the server 
│   └── helpers/                # Helper scripts
│       ├── setup_project.sh    # Script to set up project folders
│       ├── setup_client.sh     # Script to install packages listed in clientPackages.txt
│       └── setup_server.sh     # Script to install packages listed in serverPackages.txt
└── README.md                   # Project documentation
```


    
## Features

- Client Setup: Initializes a React application using create-react-app.
- Server Setup: Creates essential server directories for controllers, models, routes, middlewares, and helpers.
- Package Management: Automates the installation of dependencies for both client and server.


## Prerequisites

- Node.js and npm (Node Package Manager) should be installed. Download and install from nodejs.org.





## Setup Instructions

1. Clone the Repository

```bash
git clone https://github.com/NoureddineMaher/mern-template
cd mern-template
```

2. Run the Project Setup Script

  ## Run the Project Setup Script
  This script will create necessary folders and initialize both the client and server directories.


```bash
chmod +x scripts/helpers/setup_project.sh
./scripts/helpers/setup_project.sh
```

3. Install Client Packages

  Run the script to install the packages listed in clientPackages.txt for the React client.


```bash
chmod +x scripts/helpers/setup_client.sh
./scripts/helpers/setup_client.sh
```

4. Install Server Packages

  Run the script to install the packages listed in serverPackages.txt for the Express server.

```bash
chmod +x scripts/helpers/setup_server.sh
./scripts/helpers/setup_server.sh
```


# Contributing

Feel free to submit issues or pull requests if you encounter any bugs or have suggestions for improvements. Contributions are welcome!



## License

This project is licensed under the MIT License. See the LICENSE file for details.

