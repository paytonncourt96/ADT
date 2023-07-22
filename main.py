import streamlit as st
import mysql.connector
import streamlit_authenticator as stauth

#Database Connection:
config = {
  'user': 'root',
  'password': 'root',
  'host': '127.0.0.1',
  'database': 'vendorinvoicemgmt',
  'raise_on_warnings': True,
}

#Vendor logins
v_names = ['Auto Parts','Simple Machineries', 'Bearing', 'Security device', 'Black and Decker', 'Dyson Boiler', 'Stanley systems', 'Staples', 'Billi John', 'AMD']
v_usernames = ['AParts','SMachineries', 'Bearing', 'Sdevice', 'BDecker', 'DBoiler', 'SSystems', 'Staples', 'BJohn', 'AMD']
v_passwords = ['test','test', 'test','test','test', 'test', 'test', 'test', 'test', 'test']

#Purchaser Logins
names = ['Courtney Payton','Yashada Nikam', 'Sadaramana Chowdam', 'Olga Scriver', 'Deveshwari Pujari']
usernames = ['CPayton','YNikam', 'SChowdam', 'OScrivner', 'DPujari']
passwords = ['test','test', 'test','test']

header = st.container()


with header:
    st.title("Invoice User Management")
login_buttons = st.sidebar.radio("Select user",["Vendor", "Purchaser"])

def insert_invoice(invoice_num, item_num, material_num, material_desc, quantity, UOM, unitPrice, NetPrice, tax, totalPrice, currency, poNumber, poItem):
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()
    query = "INSERT INTO vendorinvoicemgmt.vendorinvoiceitm(invoice_num, item_num, material_num, material_desc, quantity, UOM, unitPrice, NetPrice, tax, totalPrice, currency, poNumber, poItem) VALUES (%s, %s, %s)"
    data = (invoice_num, item_num, material_num, material_desc, quantity, UOM, unitPrice, NetPrice, tax, totalPrice, currency, poNumber, poItem)
    cursor.execute(query, data)
    connection.commit()
    connection.close()
    
#Getting all invoices    
def get_invoices():
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM vendorinvoicemgmt.vendorinvoiceitm")
    invs = cursor.fetchall()
    connection.close()
    return invs

#Getting invoices totals by employees for what has already been approved
def get_invoices_by_approvers():
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()
    cursor.execute("SELECT e.employee_id, e.first_name, e.last_name, SUM(h.totalprice) AS total_amount FROM employeemaster e JOIN vendorinvoicehdr h ON e.employee_id = h.approver_id GROUP BY e.employee_id, e.first_name, e.last_name")
    p_invs = cursor.fetchall()
    connection.close
    return p_invs

#Invoices associated with the employee
def employee_invoices():
    connection = mysql.connector.connect(**config)
    cursor = connection.cursor()
    cursor.execute("SELECT e.employee_id, e.first_name, e.last_name, COUNT(h.approver_id) AS total_invoices FROM employeemaster e LEFT JOIN vendorinvoicehdr h ON e.employee_id = h.approver_id GROUP BY e.employee_id, e.first_name, e.last_name")
    e_invs = cursor.fetchall()
    connection.close
    return e_invs
                   
       
if login_buttons == "Vendor":
    # Login page
    st.header("Vendor Login")
    username = st.text_input("Username")
    password = st.text_input("Password", type="password")

    if st.button("Login"):
        # Check if the entered username and password match any registered user
        if username in v_usernames:
            user_index = v_usernames.index(username)
            if password == v_passwords[user_index]:
                st.success("Login successful!")
                st.write(f"Welcome {v_names[user_index]}!")
 
                v_option = st.radio("View or create invoices?", ("View invoices", "Enter Invoices"))
                if v_option == "View invoices":
                    st.title("View Current Invoices")
                    invs = get_invoices()
                    if invs:
                        st.table(invs)
                    else:
                        st.warning("No current invoices.")
                else:
                    st.title("Invoice Entry")
                    invoice_num = st.number_input("Invoice Number: ")
                    item_num = st.number_input("Item Number: ")
                    material_num = st.number_input("Material #: ")
                    material_desc = st.text_input("Material descr:")
                    quantity = st.number_input("Quantity: ")
                    UOM = st.text_input("Unit of Measurement: ")
                    unitPrice = st.number_input("Unit Price: ")
                    NetPrice = st.number_input("Net Price: ")
                    tax = st.number_input("Tax: ")
                    totalPrice = st.number_input("Total Price: ")
                    currency = st.text_input("Currency: ")
                    poNumber = st.number_input("PO Number: ")
                    poItem = st.text_input("PO Item: ")
                    
                    if st.button("Submit Invoice"):
                        insert_invoice(invoice_num, item_num, material_num, material_desc, quantity, UOM, unitPrice, NetPrice, tax, totalPrice, currency, poNumber, poItem)
                        st.success("Invoice Successfully Entered expect payment in 7-10 business days!") 
            else:
                st.error("Incorrect password. Please try again.")
        else:
            st.error("Username not found. Please try again.")

elif login_buttons == "Purchaser":
    # Widget 2 page
    st.header("Purchaser Login")
    username = st.text_input("Username")
    password = st.text_input("Password", type="password")

    if st.button("Login"):
        # Check if the entered username and password match any registered user
        if username in usernames:
            user_index = usernames.index(username)
            if password == passwords[user_index]:
                st.success("Login successful!")
                st.write(f"Welcome {names[user_index]}!")
                st.title("View Current Invoices")
                invs = get_invoices()
                if invs:
                    st.table(invs)
                p_invs = get_invoices_by_approvers()
                if p_invs:
                    st.table(p_invs)
                e_invs = employee_invoices()
                if e_invs:
                    st.table(e_invs)
                    
            else:
                st.error("Incorrect password. Please try again.")
        else:
            st.error("Username not found. Please try again.")




   
    



