ESX = nil
local RegisteredSocieties = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getMoneyFromUser(id_user)
	local xPlayer = ESX.GetPlayerFromId(id_user)
	return xPlayer.getMoney()

end

local function getBlackMoneyFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('black_money')
	return account.money

end

local function getBankFromUser(id_user)
		local xPlayer = ESX.GetPlayerFromId(id_user)
		local account = xPlayer.getAccount('bank')
	return account.money

end
	
TriggerEvent('es:addCommand', 'trabalho', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label

--TriggerClientEvent('esx:showNotification', _source, 'Trabalhar como:: ~g~' .. job .. ' ~s~-~g~ ' .. jobgrade)
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Trabalhar como: ' .. job .. ' - ' .. jobgrade})  
end, {help = "Mostra o teu trabalho"})

TriggerEvent('es:addCommand', 'dinheiro', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local wallet 		= getMoneyFromUser(_source)

--TriggerClientEvent('esx:showNotification', _source, 'Tens ~g~$~g~' .. wallet .. ' ~s~na carteira~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens $' .. wallet .. ' na carteira'})
end, {help = "Mostra quanto tens na Carteira"})

TriggerEvent('es:addCommand', 'banco', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local bank 			= getBankFromUser(_source)

--TriggerClientEvent('esx:showNotification', _source, 'Tens ~g~$~g~' .. bank .. ' ~s~no banco~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens $' .. bank .. ' no banco'})
end, {help = "Mostra quanto tens no banco"})

TriggerEvent('es:addCommand', 'dsujo', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local black_money 	= getBlackMoneyFromUser(_source)

--TriggerClientEvent('esx:showNotification', _source, 'Tens ~g~$~g~' .. black_money .. ' ~s~de dinheiro sujo~g~ ')
TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens $' .. black_money .. ' de dinheiro sujo'})
end, {help = "Mostra quanto dinheiro sujo tens"})

TriggerEvent('es:addCommand', 'info', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.label
    local jobgrade = xPlayer.job.grade_label
    local wallet 		= getMoneyFromUser(_source)
    local bank 			= getBankFromUser(_source)
    local black_money 	= getBlackMoneyFromUser(_source)
    if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end

                --TriggerClientEvent('esx:showNotification', _source, 'Trabalhar como:: ~g~' .. job .. ' ~s~-~g~ ' .. jobgrade)	         
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Trabalhar como: ' .. job .. ' - ' .. jobgrade})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Tens ~g~$~g~' .. wallet .. ' ~s~na carteira~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens $' .. wallet .. ' na carteira'})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Tens ~g~$~g~' .. bank .. ' ~s~no banco~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens $' .. bank .. ' no banco'})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Tens ~g~$~g~' .. black_money .. ' ~s~de dinheiro sujo~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens $' .. black_money .. ' de dinheiro sujo'})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Tens ~g~$~g~' .. money .. ' ~s~na empresa~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens $' .. money .. ' na empresa'})
																	
	else

                --TriggerClientEvent('esx:showNotification', _source, 'Trabalhar como:: ~g~' .. job .. ' ~s~-~g~ ' .. jobgrade)	         
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Trabalhar como: ' .. job .. ' - ' .. jobgrade})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Tens ~g~$~g~' .. wallet .. ' ~s~na carteira~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens $' .. wallet .. ' na carteira'})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Tens ~g~$~g~' .. bank .. ' ~s~no banco~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens $' .. bank .. ' no banco'})
                Citizen.Wait(1500)
                --TriggerClientEvent('esx:showNotification', _source, 'Tens ~g~$~g~' .. black_money .. ' ~s~de dinheiro sujo~g~ ')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens $' .. black_money .. ' de dinheiro sujo'})
                Citizen.Wait(1500)
	        --TriggerClientEvent('esx:showNotification', _source, '~r~Não tens acesso a conta da empresa')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Não tens acesso a conta da empresa'})
																	
	end
end, {help = "Check your society's balance"})

TriggerEvent('es:addCommand', 'sociedade', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end
		
                --TriggerClientEvent('esx:showNotification', _source, 'Tens ~g~$~g~' .. money .. ' ~s~na empresa~g~ ')
	        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Tens $' .. money .. ' na empresa'})
																	
	else

	        --TriggerClientEvent('esx:showNotification', _source, '~r~Não tens acesso a conta da empresa')
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Não tens acesso a conta da empresa'})
																			
	end
end, {help = "Mostra o dinheiro da empresa"})

TriggerEvent('esx_society:getSocieties', function(societies) 
	RegisteredSocieties = societies
end)

function GetSociety(name)
  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end
end