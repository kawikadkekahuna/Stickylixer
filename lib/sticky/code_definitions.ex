defmodule Sticky.CodeDefinitions do
  @response_code_map %{
    "100" => "Success",
    "200" => "Invalid login credentials",
    "300" => "Update failed due to third party rejection",
    "301" => "Error updating affiliate data",
    "320" => "Invalid Product Id",
    "321" => "Existing Product Category Id Not Found",
    "322" => "Invalid Category Id",
    "323" =>
      "Digital Delivery and Digital URL must be paired together and digital URL must be a valid URL",
    "325" => "Length Does Not Meet Minimum",
    "326" => "URL is invalid",
    "327" => "Payment Type Invalid",
    "328" => "Expiration Date Invalid (Must be in the format of MMYY with no special characters)",
    "329" => "Credit card must be either 15 or 16 digits numeric only",
    "330" => "No Status Passed",
    "331" => "Invalid Criteria",
    "332" => "Start and end date are required",
    "333" => "No Orders Found",
    "334" => "Invalid Start Date format",
    "335" => "Invalid End Date format",
    "336" => "Wild Card Unsupported for this search criteria",
    "337" => "Last 4 or First 4 must be 4 characters exactly",
    "338" => "Timestamp invalid",
    "339" => "Total Amount must be numeric and non-negative",
    "340" => "Invalid country code",
    "341" => "Invalid state code",
    "342" => "Invalid Email Address",
    "343" =>
      "Data Element Has Same Value As Value Passed No Update done (Information ONLY, but still a success)",
    "344" => "Invalid Number Format",
    "345" => "Must be a 1 or 0. \"1\" being \"On\" or true. \"0\" being \"Off\" or false.",
    "346" => "Invalid date format. Use mm/dd/yyyy",
    "347" => "Invalid RMA reason",
    "348" => "Order is already flagged as RMA",
    "349" => "Order is not flagged as RMA",
    "350" => "Invalid order Id supplied",
    "351" => "Invalid status or action supplied",
    "352" => "Uneven Order/Status/Action Pairing",
    "353" => "Cannot stop recurring",
    "354" => "Cannot reset recurring",
    "355" => "Cannot start recurring",
    "356" => "Credit card has expired",
    "357" => "Exceeded number of batch orders to view",
    "358" => "Invalid Email Address. The Email Address is already being used by a customer",
    "359" => "Cannot update recurring details of a prepaid order",
    "360" => "Cannot stop upsell recurring",
    "370" => "Invalid amount supplied",
    "371" => "Invalid keep recurring flag supplied",
    "372" => "Refund amount exceeds current order total",
    "373" => "Cannot void a fully refunded order",
    "374" => "Cannot reprocess non-declined orders",
    "375" => "Cannot blacklist test payment method",
    "376" => "Invalid tracking number",
    "377" => "Cannot ship pending orders",
    "378" => "Order already shipped",
    "379" => "Order is fully refunded/voided",
    "380" => "Order is not valid for force bill",
    "381" => "Customer is blacklisted",
    "382" => "Invalid US state",
    "383" => "All military states must have a city of either \"APO\", \"FPO\". or \"DPO\"",
    "384" => "Invalid date mode",
    "385" => "Invalid billing cycle filter",
    "386" => "Order has already been returned",
    "387" => "Invalid return reason",
    "388" => "Rebill discount exceeds maximum for product",
    "389" => "Refund amount must be greater than 0",
    "390" => "Invalid number of days supplied",
    "400" => "Invalid campaign Id supplied",
    "401" => "Invalid subscription type",
    "402" => "Subscription type 3 requires subscription week and subscription day values",
    "403" => "Invalid subscription week value",
    "404" => "Invalid subscription day value",
    "405" => "Subscription type 3 required for subscription week and subscription day values",
    "406" => "Rebill days must be a value between 1 and 31 for subscription type 2",
    "407" => "Rebill days must be greater than 0 if subscription type is 1 or 2",
    "408" => "Rebill days is invalid unless type is 1 or 2",
    "409" => "Subscription type 0, other subscription fields invalid",
    "410" =>
      "API user: (api_username) has reached the limit of requests per minute: (limit) for method: (method_name)",
    "411" => "Invalid subscription field",
    "412" => "Missing subscription field",
    "413" => "Product is not subscription based",
    "415" => "Invalid subscription value",
    "420" => "Campaign does not have fulfillment provider attached",
    "421" => "This order was placed on hold",
    "422" => "This order has not been sent to fulfillment yet",
    "423" => "Invalid SKU",
    "424" => "Fulfillment Error, provider did not specify",
    "425" => "This order has been sent to fulfillment but has not been shipped",
    "426" =>
      "This order not eligible for offline payment approval (incorrect status & payment type)",
    "430" => "Coupon Error: Invalid Promo Code",
    "431" => "Coupon Error: This promo code has expired",
    "432" => "Coupon Error: Product does not meet minimum purchase amount",
    "433" => "Coupon Error: Maximum use count has exceeded",
    "434" => "Coupon Error: Customer use count has exceeded its limit",
    "435" => "Invalid attribute found on product",
    "436" => "Invalid option found on attribute",
    "437" => "Invalid attribute combination; no variants matched for product",
    "438" => "Invalid attribute(s). Product does not have variants",
    "439" => "Product has variants; product attributes must be provided.",
    "440" => "Invalid offer Id supplied",
    "500" => "Invalid customer Id supplied",
    "550" => "Required field [] invalid or missing",
    "551" => "Invalid subscription values supplied",
    "552" =>
      "Current products max quantity cannot be greater than next recurring products quantity next recurring + products max quantiy",
    "553" =>
      "Current Products Max Quantity cannot be lowered since other products are using this product as + recurring with Preserved Quantity on",
    "554" => "A product without variants may not recur to a product with variants",
    "555" => "Failed to create product record",
    "556" => "Failed to store product description",
    "557" => "Failed to update product recurring date",
    "558" => "Failed to create product event configuration",
    "559" => "Failed to store product category",
    "560" => "Product ID not found",
    "561" => "Error deleting product",
    "562" => "This product can not be deleted because one or more orders are related to it",
    "563" => "This product can not be deleted because it is subscribed to one or more products",
    "564" =>
      "This product can not be deleted because it is currently related to one or more campaigns",
    "565" => "Events supplied without event types",
    "566" => "Event types supplied without events",
    "567" => "Number of events must match number of event types",
    "568" => "Invalid event type [] supplied",
    "569" => "Invalid event [] supplied",
    "570" => "Invalid flag supplied: []",
    "571" => "Next recurring product not supplied",
    "572" => "Subscription type not supplied",
    "573" => "Subscription type invalid",
    "574" => "Subscription type [] require field(s) []",
    "575" => "Shippable flag is required when passing shipping fields",
    "576" => "Field [] is required when passing []",
    "577" => "Category ID is invalid",
    "600" => "Invalid product Id supplied",
    "601" => "Invalid prospect Id supplied",
    "602" => "No prospects found",
    "603" => "Invalid customer Id supplied",
    "604" => "No customers found",
    "666" => "User does not have permission to use this method",
    "667" => "This user member is currently disabled",
    "668" => "ip address is invalid",
    "669" => "Unauthorized to access campaign",
    "670" => "This value added service is not enabled. Please contact client success.",
    "700" => "Invalid method supplied",
    "701" => "Action not permitted by gateway",
    "702" => "Invalid gateway Id",
    "703" => "No gateways supplied",
    "704" => "Invalid gateways supplied",
    "705" => "Gateway does not exist",
    "706" => "Invalid payment router Id",
    "707" => "No payment routers supplied",
    "708" => "Invalid payment routers supplied",
    "709" => "Payment router does not exist",
    "800" => "Transaction was declined",
    "901" => "Invalid return URL",
    "902" => "Invalid cancel URL",
    "903" => "Error retrieving alternative provider data",
    "904" => "Campaign does not support an alternative payment provider",
    "905" => "Product quantity/dynamic price does not match",
    "906" => "Invalid quantity",
    "907" => "Invalid shipping Id",
    "908" => "Payment was already approved",
    "909" => "No match found",
    "910" => "Invalid length",
    "911" => "Update failed",
    "912" => "Product is not a bundle",
    "913" => "Product is not in parent bundle product",
    "914" => "Total child items exceeds max item for bundle",
    "1000" => "SSL is required",
    "1001" => "General Error",
    "1020" => "Error saving next recurring product",
    "4001" => "Email not found for member",
    "4002" => "A member already exists for this customer",
    "4003" => "Account not found",
    "4005" => "No member token supplied",
    "4006" => "Account token expired",
    "4007" => "Invalid member token",
    "4008" => "Invalid member credentials or temp password",
    "4009" => "Account update failed. Password supplied is invalid",
    "4010" => "Account login attempt with temp password. Password must be updated",
    "4011" => "Max member failed login attempts exceeded. Password reset is required",
    "4012" => "Account temp password expired",
    "4013" => "No member password reset pending for supplied member",
    "10201" => "three_d_redirect_url is required",
    "10202" => "alt_pay_return_url is required",
    "10203" =>
      "Phone token and PIN are required for SEPA transactions in Alternative Payments provider",
    "10400" => "Invalid campaign Id",
    "10301" => "Error updating affiliate data",
    "10303" => "Invalid upsell product Id",
    "10304" => "Invalid first name",
    "10305" => "Invalid last name",
    "10306" => "Invalid shipping address1",
    "10307" => "Invalid shipping city",
    "10308" => "Invalid shipping state",
    "10309" => "Invalid shipping zip",
    "10310" => "Invalid shipping country",
    "10311" => "Invalid billing address1",
    "10312" => "Invalid billing city",
    "10313" => "Invalid billing state",
    "10314" => "Invalid billing zip",
    "10315" => "Invalid billing country",
    "10316" => "Invalid phone number",
    "10317" => "Invalid email address",
    "10318" => "Invalid payment type",
    "10319" => "Invalid credit card number",
    "10320" => "Invalid expiration date",
    "10321" => "Invalid IP address",
    "10322" => "Invalid shipping Id",
    "10323" => "CVV is required for tranType 'Sale'",
    "10324" => "Supplied CVV has an invalid length",
    "10325" => "Shipping state must be 2 characters and valid US state",
    "10326" => "Billing state must be 2 characters and valid US state",
    "10327" => "Invalid payment type",
    "10328" => "Expiration month must be between 01 and 12",
    "10329" => "Expiration date must be 4 digits long",
    "10330" => "Could not find prospect record",
    "10332" => "Could not find original order Id",
    "10333" => "Order has been black listed",
    "10334" => "The credit card number or email address has already purchased this product(s)",
    "10335" => "Invalid Dynamic Price Format",
    "10336" => "checkRoutingNumber must be passed when payment type is checking or eft_germany",
    "10337" => "checkAccountNumber must be passed when payment type is checking or eft_germany",
    "10339" => "tranType missing or invalid",
    "10340" => "Invalid employee username found",
    "10341" => "Campaign Id restricted to user",
    "10342" => "The credit card has expired",
    "10343" => "Invalid master_order_id",
    "10411" => "Invalid subscription field",
    "10412" => "Missing subscription field",
    "10413" => "Product is not subscription based",
    "10414" =>
      "The product that is being purchased has a different subscription type than the next recurring product.",
    "10415" => "Invalid subscription value",
    "10500" => "An error occurred while saving the temporary customer",
    "10501" => "Invalid temp_customer_id found",
    "10502" => "temp_customer_id has expired",
    "10550" => "Capture transactions require a valid transactionId or temp_customer_id",
    "10600" => "Invalid product Id",
    "10601" => "Invalid attribute found on product",
    "10602" => "Invalid option found on product",
    "10603" => "Invalid attribute combination; no variants matched for product",
    "10604" => "Invalid attribute(s). Product does not have variants.",
    "10605" => "Product has variants; product attributes must be provided",
    "10666" => "User does not have permission to use this method",
    "10705" => "Order is not 3DS related",
    "10800" => "Transaction was declined",
    "10901" => "Paypal payer Id is required for this payment type.",
    "10902" => "Paypal token is required for this payment type.",
    "10903" => "Alt Pay token is required for this payment type.",
    "10912" => "Product is not a bundle",
    "10913" => "Product is not in parent bundle product",
    "10914" => "Total child items exceeds max item for bundle",
    "11000" => "Could not add record",
    "11001" => "General Error"
  }

  def find_response_reason(code) when is_bitstring(code) do
    with {_, _} <- Integer.parse(code) do
      @response_code_map
      |> Map.get(code)
    else
      :error ->
        {:error, "Argument must be a number"}
    end
  end

  def find_response_reason(code) when is_integer(code) do
    code = Integer.to_string(code)

    @response_code_map
    |> Map.get(code)
  end
end
