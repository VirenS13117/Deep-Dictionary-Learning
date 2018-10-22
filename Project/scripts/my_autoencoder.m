
function autoencoder_layers = my_autoencoder(train_images,no_of_layers,hidden_layers)

autoencoder_layers = [];

%% train autoencoder 
for i=1:no_of_layers
    layer = trainAutoencoder(train_images,hidden_layers(i), ...
    'MaxEpochs',400, ...
    'L2WeightRegularization',0.004, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.15);
    train_images = encode(layer,train_images);
    autoencoder_layers = [autoencoder_layers,layer];
end
