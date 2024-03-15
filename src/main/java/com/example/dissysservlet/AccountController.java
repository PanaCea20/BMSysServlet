package com.example.dissysservlet;

import java.io.*;
import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;
import java.time.format.DateTimeParseException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name ="/AccountController")
public class AccountController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Received action: " + action);

        switch (action) {
            case "create":
                createAccount(request, response);
                break;
            case "change":
                changeAccount(request, response);
                break;
            case "search":
                searchEntry(request, response);
                break;
            case "add":
                addEntry(request, response);
                break;
            case "show":
                showEntries(request, response);
                break;
            case "changeAmount":
                changeEntryAmount(request, response);
                break;
            default:
                request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to POST method for simplicity, you can separate logic if needed
        doPost(request, response);
    }

    private void createAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountName = request.getParameter("accountName");

        if (accountName != null && !accountName.trim().isEmpty()) {
            request.getSession().setAttribute("currentAccount", accountName);
            request.setAttribute("message", "Account created successfully: " + accountName);
        } else {
            request.setAttribute("error", "Account name cannot be empty.");
        }

        request.getRequestDispatcher("createAccount.jsp").forward(request, response);
        request.getRequestDispatcher("accountCreated.jsp").forward(request, response);
    }

    private void changeAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newAccountName = request.getParameter("newAccount");

        if (newAccountName != null && !newAccountName.trim().isEmpty()) {
            request.getSession().setAttribute("currentAccount", newAccountName);
            request.setAttribute("message", "Current account changed successfully to: " + newAccountName);
        } else {
            request.setAttribute("error", "Account name cannot be empty.");
        }

        request.getRequestDispatcher("changeAccount.jsp").forward(request, response);
        request.getRequestDispatcher("accountChanged.jsp").forward(request, response);
    }

    private void searchEntry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchString = request.getParameter("searchAmount");
        // Assume entries is a List of some sort of Entry objects that are stored in the session
        List<Entry> entries = (List<Entry>) request.getSession().getAttribute("entries");
        List<Entry> searchResults = new ArrayList<>();

        if (searchString != null && !searchString.trim().isEmpty()) {
            try {
                double searchAmount = Double.parseDouble(searchString.trim());
                // In a real application, replace this with actual search logic, e.g., database query
                if (entries != null) {
                    for (Entry entry : entries) {
                        if (entry.getAmount() == searchAmount) {
                            searchResults.add(entry);
                        }
                    }
                }
                request.setAttribute("searchResults", searchResults);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid amount format.");
            }
        } else {
            request.setAttribute("error", "Amount field cannot be empty.");
        }

        request.getRequestDispatcher("searchEntry.jsp").forward(request, response);
        request.getRequestDispatcher("entriesFound.jsp").forward(request, response);
    }

    private void addEntry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        String amountString = request.getParameter("amount");
        String dateString = request.getParameter("date");

        try {
            double amount = Double.parseDouble(amountString);
            LocalDate date = LocalDate.parse(dateString);

            // Perform validation on description, amount, and date if needed

            // Assuming some entry adding logic here
            // For example:
            // EntryService.addEntry(description, amount, date);

            // Set success message and forward to entryAdded.jsp
            request.setAttribute("message", "Entry added successfully!");
            request.getRequestDispatcher("entryAdded.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle amount parsing error
            request.setAttribute("error", "Invalid amount. Please enter a valid number.");
            request.getRequestDispatcher("addEntry.jsp").forward(request, response);
        } catch (DateTimeParseException e) {
            // Handle date parsing error
            request.setAttribute("error", "Invalid date format. Please enter a date in YYYY-MM-DD format.");
            request.getRequestDispatcher("addEntry.jsp").forward(request, response);
        } catch (Exception e) {
            // Handle other exceptions
            request.setAttribute("error", "An error occurred while adding the entry.");
            request.getRequestDispatcher("addEntry.jsp").forward(request, response);
        }
    }

    private void showEntries(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assuming 'entries' is a List object stored in the session representing the current account's entries
        List<Entry> entries = (List<Entry>) request.getSession().getAttribute("entries");

        // Set the entries as a request attribute to be accessed by the JSP page
        request.setAttribute("entries", entries);

        // Forward the request to the JSP page
        request.getRequestDispatcher("entriesList.jsp").forward(request, response);
    }

    private void changeEntryAmount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String entryIdString = request.getParameter("entryId");
        String newAmountString = request.getParameter("newAmount");

        String message;
        try {
            int entryId = Integer.parseInt(entryIdString);
            double newAmount = Double.parseDouble(newAmountString);

            // Here, implement the logic to find the entry by ID and update its amount.
            // This might involve interacting with a database or a data structure in session.
            // For demonstration, we'll assume a successful update:
            message = "Amount updated successfully for Entry ID: " + entryId;

        } catch (NumberFormatException e) {
            message = "Invalid entry ID or amount format.";
        } catch (Exception e) { // Replace with more specific exceptions if possible
            message = "An error occurred while updating the amount.";
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("entryAmountChanged.jsp").forward(request, response);
    }
}