# Slowly-Changing-Dimensions-in-DW

## Slowly Changing Dimensions (SCD) refer to dimensions in a data warehouse that change over time, but not frequently. These changes might include updates or additions to historical records or other changes in dimension attributes.

# Here I have implemented SCD Type 1 and Type 2 using SQL by taking different iphone launches and price changes over time.

### SCD Type 1 – Overwrite
### Definition: When a change occurs, the old value is simply overwritten with the new value. There is no historical tracking of changes.
### Use case: This is used for attributes that are not important to track historically, such as correcting typos or minor changes.

### Type 2 – Add New Row
### Definition: A new record is added to the dimension table with a new surrogate key to reflect the change. This preserves historical values by creating a new row with the new data and updating the relevant fields ### (e.g., effective date, current flag).
### Use case: Used when historical tracking is essential. For example, when you need to keep track of historical addresses for a customer.

### Type 3 – Add New Column
### Definition: A new column is added to store the previous value of the attribute. This allows you to track a limited history of changes, typically the most recent value and the previous value.
### Use case: Used when only a limited history is needed, and the number of changes is not too many. For example, if you only need to track the previous and current job title of an employee.
