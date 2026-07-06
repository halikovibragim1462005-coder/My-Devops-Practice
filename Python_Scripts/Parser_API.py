import requests
import csv

response = requests.get("https://jsonplaceholder.typicode.com/users")
data = response.json()


def save_def(data, filename):
    with open(filename, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["Name", "Email", "Username", "Phone"])
        writer.writeheader()
        for date in data:
            writer.writerow(
                {
                    "Username": date["username"],
                    "Name": date["name"],
                    "Email": date["email"],
                    "Phone": date["phone"],
                }
            )
    return filename


result = save_def(data, "python_trending.csv")
with open(result, "r") as f:
    print(f.read())
