require("pry")

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_pets_sold)
  pet_shop[:admin][:pets_sold] += number_of_pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
  list_for_breed=[]
  pets_array = pet_shop[:pets]
  for pet_hash in pets_array
    if pet_hash[:breed] == breed
      list_for_breed << pet_hash
    end
  end
  return list_for_breed
end

def find_pet_by_name (pet_shop, pet_name)
  for pet in pet_shop[:pets]
    return pet if pet[:name] == pet_name
  end
  return nil
end

def remove_pet_by_name (pet_shop, pet_name)
  for pet in pet_shop[:pets]
     if pet[:name] == pet_name
       pet_shop[:pets].delete(pet)
     end
  end
end

def add_pet_to_stock (pet_shop, pet_to_add)
  pet_shop[:pets] << pet_to_add
end

def customer_cash (customer_in_array)
  customer_in_array[:cash]
end

def remove_customer_cash(customer_in_array, amount_to_remove)
  customer_in_array[:cash] -= amount_to_remove
end

def customer_pet_count (customer_in_array)
  return customer_in_array[:pets].count()
end
