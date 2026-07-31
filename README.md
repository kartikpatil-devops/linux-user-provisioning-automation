# 🐧 Linux User Provisioning & Permission Management Automation

## 📌 Project Overview

This project automates the process of user provisioning and permission management in Linux using **Bash Shell Scripting**.

In enterprise environments, system administrators often need to create multiple users, assign them to appropriate departments, configure permissions, and maintain activity logs. Performing these tasks manually is time-consuming and prone to human error.

This project automates the complete user onboarding process by reading user information from a CSV file and performing all required administrative tasks automatically.

---

# 🎯 Objectives

- Automate Linux user creation
- Reduce manual administrative effort
- Improve consistency in user management
- Apply Linux security best practices
- Gain hands-on experience with Bash scripting

---

# 🏗 Project Architecture

```
                users.csv
                     │
                     ▼
          Bash Shell Script
                     │
     ┌───────────────┼────────────────┐
     │               │                │
     ▼               ▼                ▼
Create Users    Create Groups   Create Directories
     │               │                │
     └───────────────┼────────────────┘
                     ▼
      Assign Permissions & Ownership
                     │
                     ▼
             Provisioning Log File
```

---

# 🛠 Technologies Used

- Ubuntu Linux
- Bash Shell Scripting
- Linux User Management
- Linux Group Management
- File Permissions
- CSV File Processing
- chmod
- chown
- useradd
- groupadd
- usermod

---

# 📂 Project Structure

linux-user-provisioning-automation/

├── README.md
├── LICENSE
├── .gitignore
│
├── script/
│   └── create_users.sh
│
├── input/
│   └── users.csv
│
├── logs/
│   └── provisioning.log
│
├── docs/
│   ├── deployment-guide.md
│   ├── troubleshooting.md
│   └── project-flow.md
│
├── architecture/
│   └── architecture.drawio
│
└── screenshots/

---

# ⚙ Input File Format

The script reads user information from a CSV file.

Example:

```csv
Username,Department
john,HR
alice,Finance
rahul,IT
rohan,IT
smith,Sales
```

---

# 🚀 Features

✅ Reads user details from a CSV file

✅ Automatically creates Linux users

✅ Creates department-wise groups

✅ Adds users to their respective groups

✅ Creates department-wise shared directories

✅ Assigns directory ownership

✅ Configures Linux file permissions

✅ Maintains a provisioning log

✅ Reduces manual administrative effort

---

# 📋 Workflow

## Step 1

Read user information from **users.csv**

↓

## Step 2

Check whether the user already exists.

↓

If user does not exist

↓

Create Linux user

```
useradd
```

↓

## Step 3

Check whether the department group exists.

↓

If not

↓

Create group

```
groupadd
```

↓

## Step 4

Add user to department group.

```
usermod -aG
```

↓

## Step 5

Create shared department directory.

Example

```
/shared/IT

/shared/HR

/shared/Finance
```

↓

## Step 6

Assign ownership.

```
chown
```

↓

## Step 7

Assign permissions.

```
chmod
```

↓

## Step 8

Log every activity.

---

# 🔐 Permission Strategy

Each department receives its own shared directory.

Example

```
/shared/IT

/shared/HR

/shared/Finance
```

Ownership

```
root:IT
```

Permissions

```
770
```

Meaning

Owner

✔ Read

✔ Write

✔ Execute

Group

✔ Read

✔ Write

✔ Execute

Others

❌ No Access

---

# 📜 Commands Used

Create User

```bash
useradd
```

Create Group

```bash
groupadd
```

Add User to Group

```bash
usermod -aG
```

Change Ownership

```bash
chown
```

Change Permissions

```bash
chmod
```

View Groups

```bash
groups
```

View Users

```bash
cat /etc/passwd
```

---

# ▶️ How to Run

Clone Repository

```bash
git clone https://github.com/<your-username>/linux-user-provisioning-automation.git
```

Go inside project

```bash
cd linux-user-provisioning-automation
```

Give execute permission

```bash
chmod +x create_users.sh
```

Run script

```bash
sudo ./create_users.sh
```

---

# 📸 Screenshots

Add screenshots in this order.

```
01-users.csv

02-script-running

03-users-created

04-groups-created

05-shared-directories

06-directory-permissions

07-log-file
```

---

# 📄 Log File

Example

```
[INFO] Creating user john

[SUCCESS] User john created

[INFO] Group IT exists

[SUCCESS] Added john to IT

[SUCCESS] Created /shared/IT

[SUCCESS] Permissions configured

-----------------------------------
```

---

# ⚠ Error Handling

The script checks for

- Existing users
- Existing groups
- Invalid CSV records
- Missing input file
- Permission errors
- Failed user creation

This prevents duplicate entries and improves reliability.

---

# 📚 Learning Outcomes

Through this project I gained practical experience in

- Linux User Administration
- Linux Group Management
- Shell Scripting
- File Ownership
- Linux Permissions
- CSV File Handling
- Process Automation
- Production-style User Provisioning
- Logging and Error Handling
- Linux Security Best Practices

---

# 🚀 Future Enhancements

- Password generation
- Email notification
- SSH key creation
- Home directory templates
- Password expiry policy
- User deletion automation
- LDAP Integration
- Active Directory Integration
- AWS IAM integration
- Ansible Automation

---

# 💼 Real-World Use Cases

This project can be used by

- System Administrators
- Linux Administrators
- DevOps Engineers
- Cloud Engineers
- IT Support Teams

to automate employee onboarding and manage user access efficiently.

---

# 🎤 Interview Questions

## Why did you use a CSV file?

CSV provides a simple, structured, and scalable way to manage multiple user records without modifying the script.

---

## Why create groups?

Groups simplify permission management by assigning access to a collection of users instead of configuring permissions individually.

---

## Why use `usermod -aG`?

The `-aG` option appends the user to a supplementary group without removing them from existing groups.

---

## Why use `chmod 770`?

It grants full access to the owner and group while preventing access for others, improving security for shared departmental directories.

---

## Why maintain a log file?

Logs help track provisioning activities, simplify troubleshooting, and provide an audit trail of administrative actions.

---

## What would you improve in this project?

- Secure password management
- Better error handling
- Configuration through external files
- Email notifications
- Integration with enterprise identity systems such as LDAP or Active Directory

---

# 👨‍💻 Author

**Kartik Patil**

| Linux Administrator | AWS Cloud  | DevOps |

📧 Email: patilkartik74999@gmail.com

🔗 LinkedIn: www.linkedin.com/in/kartikpatil7
