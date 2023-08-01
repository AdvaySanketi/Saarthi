from datetime import datetime
import json
import hashlib
import requests

#@get_https
class Blockchain1:
    def __init__(self):
        with open('blockchain.json') as bk:
            self.chain = list(json.load(bk))
        #self.chain=[]
        if not self.chain:
            gen_block_data=self.merkle_root(['This is the genesis block'])
            self.chain.append({'index':1,"merkle root":gen_block_data,'timestamp':str(datetime.now()),'data':'This is the genesis block','proof':1,'previous hash':0})
        

    def create_block(self,block_data):
        proof=self.proof_of_work(block_data)
        prev_block=self.previous_block()
        merkle_root=self.merkle_root(block_data)
        previous_hash=self.block_hash(prev_block)
        block={"index":len(self.chain)+1,
               "merkle root":merkle_root,
               "timestamp":str(datetime.now()),
               "data":block_data,
               "proof":proof,
               'previous hash':previous_hash
               }
        self.chain.append(block)
        with open("blockchain.json",'w') as bk:
            json.dump(self.chain,bk,indent=4)
        return block
    
    def mine_block(self,data):
        proof=self.proof_of_work(data)
        new_block=self.create_block(data)
        return new_block       


    def block_hash(self,block):
        encoded_block=json.dumps(block,sort_keys=True).encode()
        return hashlib.sha256(encoded_block).hexdigest()
    
    def proof_of_work(self,data):
        new_proof=1
        chain_valid=False
        index=len(self.chain)+1
        
        while not chain_valid:
            prev_block_proof=self.previous_block()
            encoded_data=hashlib.sha256(self.hash_operation(index,data,prev_block_proof['proof'],new_proof)).hexdigest()
            if encoded_data[:4]=="0000":
                chain_valid=True
            else:
                new_proof+=1

        return new_proof
    
    def previous_block(self):
        return self.chain[-1]
    
    def hash_operation(self,index,data,previous_proof,new_proof):
        hash_op=str((new_proof**2)-(previous_proof**2) + index)+ str(data)
        return hash_op.encode()
    
    def chain_valid(self):
        block_index=1
        while block_index < len(self.chain):
            current_block=self.chain[block_index]
            previous_block=self.chain[block_index-1]
            previous_proof=previous_block['proof']
            current_data,current_proof,current_index=current_block['data'],current_block['proof'],current_block['index']
            encoded_data=hashlib.sha256(self.hash_operation(current_index,current_data,previous_proof,current_proof)).hexdigest()
            if current_block['previous hash']!=self.block_hash(previous_block):
                return False  
                break          
            if encoded_data[:4]!='0000':
                return False
                break
            block_index+=1
        return True
    
    def merkle_root(self,l):
        
        l1=[]
        for i in l:
             l1.append(hashlib.sha256(str(i).encode()).hexdigest())
        if len(l1)%2!=0:
            l1.append(l1[-1])
        length=len(l1)
        state=True
        while state==True:
            p=[]
            for i in range(int(len(l1)/2)):
                first_hash=l1[0]
                second_hash=l1[1]
                combined_hash=first_hash+second_hash
                p.append(hashlib.sha256(combined_hash.encode()).hexdigest())
                l1.pop(0)
                l1.pop(0)
            
            if len(l1)==0:
                l1=p
            if len(p)==1:
                state=False
                return p[0]