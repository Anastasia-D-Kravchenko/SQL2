# Project README: Multi-Domain Relational Database Systems

This project encompasses a series of specialized relational database designs and SQL implementations across several distinct domains, including financial monitoring (SWIFT), logistics, sports, and zoology.

---

## 🛠 Project Components

The project is structured as a collection of schema definition scripts (DDL), data insertion scripts (DML), and complex analytical queries.

### 1. Financial Monitoring & Security (SWIFT)

This module focuses on the secure logging and monitoring of international financial transfers.

* **Transaction Logging**: Tracks detailed message types, Sender/Receiver BICs, amounts, and statuses.
* **Access Control**: Implements Access Control Lists (ACL) and User Role Access to manage permissions (Read, Write, Approve) for sensitive resources.
* **System Forensics**: Dedicated logging for system events and alerts, enabling the identification of anomalous behavior (e.g., high-value approvals outside normal hours).

### 2. Transport & Logistics Management

Designs targeting urban mobility and aviation infrastructure.

* **Aviation (`airplanes_create.sql`)**: Manages fleet data (models, capacity, range), flight schedules, and personnel assignments (pilots, stewards) including language competencies.
* **Public Transit (`bus_communication_create.sql`)**: Models bus lines, routes, and stops, featuring precise departure time tracking and schedule validity periods.

### 3. Specialized Domain Modeling

* **Zoo Operations (`Zoo_create.sql`)**: A comprehensive system tracking animal health, dietary requirements, and enclosure assignments. It includes links to veterinary examination records and caretaker history.
* **Sports Analytics (`Soccer_create.sql`)**: Tracks match logistics, player positions, and disciplinary actions (red cards) with temporal precision.
* **Mountain Trail Systems (`Trails_create.sql`)**: Models physical geography through peak altitudes, trail colors, and estimated travel times between trail points.

---

## 🚀 How to Use

### Database Initialization

1. **Schema Creation**: Select the desired domain and run the corresponding `_create.sql` script to establish tables and foreign key constraints.
2. **Data Population**: Execute `FillingData.sql` to load the tables with standardized test cases, including categories, account types, and sample transactions.

### Analytical Querying

The `Queries.sql` script provides a template for advanced data extraction:

* **Join Operations**: Combining transactions with currency data to filter high-value transfers.
* **Aggregation**: Using `GROUP BY` and `HAVING` to identify users with excessive error logs or to calculate average transaction amounts per message category.
* **Subqueries**: Identifying outliers, such as transactions exceeding the global average or users associated with specific system alerts.

---

## 📂 File Manifest

* **`create_swift.sql` / `swift.sql**`: Financial transaction and system log schemas.
* **`airplanes_create.sql` / `bus_communication_create.sql**`: Logistics and transit designs.
* **`Zoo_create.sql` / `Soccer_create.sql` / `Trails_create.sql**`: Domain-specific organizational schemas.
* **`Queries.sql` / `FillingData.sql**`: Scripts for data lifecycle management and reporting.
* **`Security_Logging_and_Monitoring... (3).sql`**: Enhanced security-focused design for financial services.
