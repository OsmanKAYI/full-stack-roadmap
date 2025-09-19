# All You Need to Know About 3D Secure

**TLDR:**  
3D Secure is a system enhancing online payment security, involving the cardholder, the bank, and the merchant. Although it adds extra protection for users, it primarily safeguards merchants from chargebacks by verifying cardholder identity. Merchants should consider offering 3D Secure, especially for transactions involving debit/prepaid cards or high-fraud risk products. Various models, such as 3D Model, 3D-PAY, and 3D-PAY-OOS, offer different integration methods, with 3D Model being the most recommended for its thorough verification process.

---

## What is 3D Secure?

Originally developed by Visa as **"Verified by Visa"**, and later adopted by MasterCard under the name **"SecureCode"**, 3D Secure is a protocol that secures online payments. It acts as an intermediary between the **merchant**, **bank**, and **cardholder**, requiring the user to input additional verification (like an SMS code or CVC2) during a transaction. This ensures the card is used by its rightful owner, preventing unauthorized usage.

![3D secure interface](https://blog.craftgate.io/wp-content/uploads/2022/09/3d-secure-arayuzu-1024x501.jpg)

---

## Advantages and Disadvantages of 3D Secure

**Advantages:**  
While 3D Secure primarily benefits merchants by reducing fraud and chargebacks, it also provides peace of mind to users, especially when shopping on untrusted websites. Merchants are protected from the misuse of stolen cards, and transactions are verified with additional authentication steps.

**Disadvantages:**  
On the downside, the extra steps involved in 3D Secure can lead to a longer transaction process. Issues such as wrong SMS codes, browser redirection problems, or delays in receiving the SMS can cause users to abandon the transaction. This often results in a lower success rate for 3D Secure transactions (around **65-75%** compared to **80-85%** for regular transactions).

---

## Should 3D Secure Be Offered or Used?

Offering 3D Secure is essential for gaining user trust, especially when accepting debit and prepaid cards, which cannot process payments without 3D Secure. It's also crucial for merchants dealing with high-risk products (e.g., electronics, flight tickets) or services prone to fraud.

---

## 3D Secure Models: Which Should Be Preferred?

Three main models exist for integrating 3D Secure, with the **3D Model** being the most reliable and recommended. This model offers a robust verification process involving a triple-handshake (merchant, Craftgate, and bank), minimizing issues like duplicate transactions or failed orders. Craftgate supports only this model, ensuring a smooth, verified payment experience.

![e-commerce payment interface](https://blog.craftgate.io/wp-content/uploads/2022/09/e-ticaret-odeme-arayuzu-1.jpg)

### 3D Model

In this model, after the user inputs card details and selects 3D Secure, the transaction is forwarded to 3DGate and then the Access Control Server (ACS). The user is asked to input an SMS code or CVC2, ensuring the transaction's legitimacy. Once confirmed, the transaction status is sent to the merchant's success or fail URL via browser redirection. This model allows merchants to perform necessary checks before completing the transaction, providing a secure and synchronized process.

![How 3D Secure works](https://blog.craftgate.io/wp-content/uploads/2022/09/3d-secure-nasil-calisir-1024x690.jpg)

### 3D-PAY Model

Similar to the 3D Model, except the payment is processed immediately after the user inputs the verification code. If an issue arises, like a disconnected internet connection or a removed product, the user may be charged without receiving the service, creating potential problems for the user, support, and accounting teams.

### 3D-PAY-OOS Model

Ideal for smaller businesses with no dedicated software team. The entire payment process is hosted by the bank, with no need for the merchant to maintain a separate payment page. It functions like the 3D-PAY Model.

---

## What is Full 3D Secure Verification, and Should It Be Used?

Full verification occurs when the user correctly inputs the SMS code, and the transaction status is **mdstatus=1**. This ensures full compliance and enables merchants to dispute chargebacks effectively. Partial verification, marked by **mdstatus** values like **2**, **3**, or **4**, offers less protection, leaving merchants vulnerable to chargebacks. Depending on the agreement with the bank, partial verification can still be used, but full verification is recommended for the highest security.

- \[SUCESS_URL\] \[FULL\] **mdStatus = 1** : Full verification
- \[SUCESS_URL\] \[HALF\] **mdStatus = 2** : Cardholder or bank not registered
- \[SUCESS_URL\] \[HALF\] **mdStatus = 3** : Bank not registered
- \[SUCESS_URL\] \[HALF\] **mdStatus = 4** : Verification attempted, cardholder opted for later registration
- \[FAIL_URL\] – **mdStatus = 5** : Verification failed
- \[FAIL_URL\] – **mdStatus = 6** : 3D Secure error
- \[FAIL_URL\] – **mdStatus = 7** : System error
- \[FAIL_URL\] – **mdStatus = 8** : Unknown card number
- \[FAIL_URL\] – **mdStatus = 0** : Invalid 3D Secure signature, failed verification, wrong SMS code, or user cancellation

**Ref:** [Hakan Erdoğan - craftgate](https://blog.craftgate.io/3d-secure-ile-ilgili-tum-merak-ettikleriniz)
