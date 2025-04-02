# Home Tutor Search and Booking System

## Features

### 1. Admin Management
- **Add Admin** (`add-admins.jsp`, `AddAdminServlet.java`)
- **Edit Admin** (`update-admin.jsp`, `UpdateAdminServlet.java`)
- **Delete Admin** (`view-admin.jsp`, `ViewAdminServlet.java`, `DeleteAdminServlet.java`)
- **Data Storage**: `admins.txt`
- **Admin Class**:
  ```java
  class Admin {
      String ID;
      String Email;
      String Name;
      String ContactNo;
      String Password;
  }
  ```
- Uses `ArrayList<Admin>` to store admins:
  ``` java
  ArrayList<Admin> admins = new ArrayList<Admin>();
  ```

### 2. User Management
- **User Registration** (`user-register.jsp`, `UserRegisterServlet.java`)
- **User Login** (`user-login.jsp`, `UserLoginServlet.java`)
- **User Profile** (`user-profile.jsp`, `UserProfileServlet.java`)
- **Data Storage**: `users.txt`
- **User Class**:
  ```java
  class User{
      String ID;
      String Email;
      String Name;
      int Age;
      String ContactNo;
      String Gender;
      String Password;
  }
  ```

- Uses `ArrayList<User>` to store users:
    ```java
    ArrayList<User> users = new ArrayList<User>();
    ```


### 3. Tutor Management (Hard :l )
- **Add Tutor** (`add-tutor.jsp`, `AddTutorServlet.java`)
- **Edit Tutor** (`update-tutor.jsp`, `UpdateTutorServlet.java`)
- **Delete Tutor** (`view-tutors.jsp`, `ViewTutorServlet.java`, `DeleteTutorServlet.java`)
- **Data Storage**: `tutors.txt`
- **Tutor Class**:
  ```java
  class Tutor extends User {
      String ID;
      String Email;
      String Name;
      int Age;
      String Gender;
      String Subject;
      int RatingLevel;
      String Password;
      String ContactNo;
      String CostPerHour;
  }
  ```

#### DSA part (WE HAVE TO APPLY)
- Use Binary Tree to save all tutors.
- Implement Merge Sort to sort tutors.
- Need to implement Binary Tree manually and use it for storing tutors.


### 4. Booking Management
- **Book a Tutor** (`booking-tutor.jsp`, `BookTutorServlet.java`)
- **Edit Booking** (`update-book.jsp`, `UpdateBookingServlet.java`)
- **Delete Booking** (`view-booking.jsp`, `DeleteBookingServlet.java`)
- **Data Storage**: `bookings.txt`
- **Booking Class**:
  ``` java
  class Booking {
      String ID;
      String UserID;
      String TutorID;
      String Time;
      String Date;
      int Hours;
  }
  ```
- Uses ArrayList<Booking> to store bookings:
  ``` java
  ArrayList<Booking> bookings = new ArrayList<Booking>();
  ```
  

### 5. Review Management
- **Add Review** (`add-review.jsp`, `AddReviewServlet.java`)
- **Delete Review** (`view-review.jsp`, `DeleteReviewServlet.java`)
- **Data Storage**: `reviews.txt`
- **Review Class**:
  ``` java
  class Review {
      int ID;
      int UserID;
      int TutorID;
      String ReviewMessage;
      int rating;
      String date;
  }
  ```
- Uses ArrayList<Review> to store Reviews:
    ```java 
    ArrayList<Review> reviews = new ArrayList<Review>();
    ```


### 6. Payment History
- **Create Payment on Booking** (`payment.jsp`, `PayServlet.java`)
- **View Payments** (`view-payments.jsp`, `ViewPaymentsServlet.java`)
- **Data Storage**: `payments.txt`
- **Payment Class**:
  ``` java
  class Review {
      int ID;
      int TutorID;
      int UserID;
      String Time;
      String Date;
      double cost;
  }
  ```
- Uses ArrayList<Payment> to store Payment:
    ```java 
    ArrayList<Payment> payments = new ArrayList<Payment>();
    ```


### File Handling
- To handle file read and write operations, use `FileHandler.java`, located in: `/src/main/java/com/example/demo/utils`

- This class contains 4 methods, but you only need to use the following 2:

```java
// Write new data to a file
public static boolean writeToFile(String fileName, boolean append, String data);
```

```java
// Read the entire content of a file line by line into a string array
public static String[] readFromFile(String fileName);
```


To use the `writeToFile` and `readFromFile` methods from `FileHandler.java` in another file, follow these steps:

#### 1. Writing Data to a File
To save data in a file, call `writeToFile` as shown below:

```java
import com.example.demo.utils.FileHandler;

public class ExampleWrite {
    public static void main(String[] args) {
        String fileName = "users.txt";
        String data = "U001, user1@example.com, John Doe, 25, 1234567890, Male, password123";

        boolean isWritten = FileHandler.writeToFile(fileName, true, data);
        
        if (isWritten) {
            System.out.println("Data successfully written to " + fileName);
        } else {
            System.out.println("Failed to write data.");
        }
    }
}
```

#### 2. Reading Data from a File
To read data from a file, use readFromFile:

```java
import com.example.demo.utils.FileHandler;

public class ExampleRead {
    public static void main(String[] args) {
        String fileName = "users.txt";

        String[] users = FileHandler.readFromFile(fileName);

        if (users.length > 0) {
            System.out.println("Data from " + fileName + ":");
            for (String user : users) {
                System.out.println(user);
            }
        } else {
            System.out.println("No data found in " + fileName);
        }
    }
}
```
