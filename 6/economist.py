def load_data(data_path='/Users/maxlikely/data/economist/raw/debates'):
    '''

    Loads the economist data as dict of lists of debates. Each debate is a
    dictionary.

    Returns:
        {'The house believes a military intervention in Syria...': [d0, d1, d2],
         'The house believes...' ...}
    '''
    import json
    import path
    from collections import defaultdict
    from collections import Counter

    filenames = path.path(data_path).files('*.json')
    new_debates = defaultdict(list)
    for filename in sorted(filenames):
        with open(filename) as f:
            debate = json.load(f)
        m = debate.get('mod_statement', '')
        y = debate.get('yay_statement', '')
        n = debate.get('nay_statement', '')
        d = debate.get('description', '')
        debate['filename'] = str(filename)
        if not (m and y and n):
            continue
        new_debates[d].append(debate)

    return new_debates
