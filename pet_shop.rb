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
  # for pet in pet_shop[:pets]
  #   return pet if pet[:name] == pet_name
  # end
  # return nil

  # solution:
  match = nil
  for pet in pet_shop[:pets]
    match = pet if(pet[:name] == pet_name)
  end
  return match
end


def remove_pet_by_name (pet_shop, pet_name)
  # for pet in pet_shop[:pets]
  #    if pet[:name] == pet_name
  #      pet_shop[:pets].delete(pet)
  #    end
  # end

  # solution
  pet_to_delete = find_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete(pet_to_delete)
end

def add_pet_to_stock (pet_shop, pet_to_add)
  pet_shop[:pets] << pet_to_add
end

def customer_cash(customer_in_array)
  customer_in_array[:cash]
end

def remove_customer_cash(customer_in_array, amount_to_remove)
  customer_in_array[:cash] -= amount_to_remove
end

def customer_pet_count(customer_in_array)
  return customer_in_array[:pets].count()
end

def add_pet_to_customer(customer_in_array, pet_to_add)
    customer_in_array[:pets] << pet_to_add
end

def customer_can_afford_pet(customer_in_array, pet_to_buy)
    customers_cash= customer_cash(customer_in_array)
    price_of_pet=pet_to_buy[:price]
    customers_cash >= price_of_pet #returns true or false
    #   return true
    # else
    #   return false
    # end
end

def sell_pet_to_customer(pet_shop, pet_hash, customer_in_array)
  # binding.pry
  return if (pet_hash == nil)
  return if !(customer_can_afford_pet(customer_in_array, pet_hash))
  # customer_cash(customer_in_array) < pet_hash[:price]
  # if pet_hash != nil
  # find_pet_by_name(pet_shop, pet_hash[:name]) == pet_hash
  increase_pets_sold(pet_shop, 1) #add to petshop's sold
  remove_pet_by_name(pet_shop, pet_hash[:name]) #remove pet from petshop
  add_pet_to_customer(customer_in_array, pet_hash)#add pet to customer's pets
  remove_customer_cash(customer_in_array, pet_hash[:price]) #remove cost of pet from customer
  add_or_remove_cash(pet_shop, pet_hash[:price]) #add cost of pet to petshop
  # else
  #   return
  # end

end
