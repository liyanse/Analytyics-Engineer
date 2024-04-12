import csv
import random

# List of names excluding "Rachael Kibicho"
names = [
    "Brandon Muraya", "Collins Cheruiyot", "Dennis Kipyegon",
    "Dennis Njogu", "Edgar Kiprono", "Edwin Mwenda",
    "Elizabeth Masai", "Esther Omulokoli", "James Koli",
    "Jeremy Ngugi", "Joyce Muthiani",
    "Kenneth Karanja", "L Mumbi", "Lee Ndungu",
    "Margaret Thiga", "Milton Kabute", "Moschini Onyango",
    "Paul Mwangi", "Pete Njagi", "Peter Mainye",
    "Ronald Kipngetich", "Salman Yusuf",
    "Sarah Karanja", "Thorne Makau", "Tom Mwambire"
]

# Shuffle the list of names
random.shuffle(names)

# Divide the shuffled list into two groups
group1 = names[:len(names)//2]
group2 = names[len(names)//2:]

# Create pairs
pairs = list(zip(group1, group2))

# Save pairs to CSV file
with open('paired students.csv', 'w', newline='') as csvfile:
    fieldnames = ['Day', 'Pair']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    writer.writeheader()
    for day, pair in enumerate(pairs, start=1):
        # Exclude 'Rachael Kibicho'
        if 'Rachael Kibicho' in pair:
            pair = (pair[0] if pair[1] == 'Rachael Kibicho' else pair[1],)

        writer.writerow({'Day': f'Day {day}', 'Pair': list(pair)})

print("Pairs have been saved to 'paired_students.csv'")
